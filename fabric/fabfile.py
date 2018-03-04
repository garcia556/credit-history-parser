import os
from fabric.api import *
from fabric.operations import sudo
from fabric.contrib.project import rsync_project
from fabric.contrib.console import confirm

USER_CONFIRMATION = "Are you sure?"
ABORT_MESSAGE = "Aborting ..."

USERNAME = "ps"
PASSWORD = "ps"

UPLOAD_ROOT = "../"
PATH_DOCKER = "docker"

ENVS = {
    "dev": {
        "host": "chparser",
        "variables": {
            "NODE_ENV": "development"
        }
    }
}

env.user = USERNAME

##########################################################

def confirmn(msg):
    return confirm(msg, default = False)

##########################################################

def set_env(name):
    config = ENVS[name]

    env_vars = "export "
    for k, v in config["variables"].items():
        env_vars += k + "='" + v + "' "

    env.target = name

    env.hosts = [ config["host"] ]
    env.command_prefixes = [ env_vars ]

@task
def dev():
    set_env("dev")

### upload functions
def upload_dir(target, exclude = []):
    source = UPLOAD_ROOT + target

    run("mkdir -p {path}".format(path=target))

    # additional exludes (hidden files)
    exclude.extend([ ".*" ])

    local_dir = source

    rsync_opts = "-P"
    rsync_opts = ""
    rsync_project(local_dir=local_dir, remote_dir=target, exclude=exclude, delete=True, extra_opts=rsync_opts)

###################

@task
def upload_db():
    upload_dir("dbgen/diff/")

@task
def upload_api():
    upload_dir("api/", [ "node_modules" ])
    upload_dir("transform/")

@task
def upload_docker():
    upload_dir(PATH_DOCKER + "/", [ "volumes/db/data", "volumes/node_modules", "volumes/xml" ])

###################

def compose_exec(op):
    with cd(PATH_DOCKER):
        run("docker-compose " + op)

def compose_exec_service(op, service = ""):
    if service == "" and not confirmn("Perform {op} on all services?".format(op=op)):
        abort(ABORT_MESSAGE)

    cmd = '''
SERVICE=''' + service + '''
OP=''' + op + '''

docker-compose ${OP} ${SERVICE}
sleep 3'''
    with cd(PATH_DOCKER):
        run(cmd)

###################

def npm_install():
    cmd = '''
source env.sh

docker run \\
    --rm \\
    --workdir /app \\
    --volume $(realpath ../api):/app \\
    --volume $(realpath ./volumes/node_modules):/app/node_modules \\
    "node:${NODE_VERSION}-alpine" \\
    npm install'''
    with cd(PATH_DOCKER):
        run(cmd)

###################

@task
def upload_all():
    upload_db()
    upload_api()
    upload_docker()

###################

@task
def purge_logs():
    env.warn_only = True

    with cd(PATH_DOCKER):
        run("rm ./volumes/api*/*.log")
        run("rm ./volumes/xml/*")

###################

@task
def start(service = ""):
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    compose_exec_service("start", service)

@task
def stop(service = ""):
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    compose_exec_service("stop", service)

@task
def restart(service = ""):
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    compose_exec_service("restart", service)

@task
def kill(service = ""):
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    compose_exec_service("kill", service)

def undeploy_worker():
    compose_exec("down")

@task
def undeploy():
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    undeploy_worker()

def deploy_worker():
    with cd(PATH_DOCKER):
        run("cp env.sh .env")
        run('echo "WD=$(pwd)" >> .env')
    compose_exec("down")
    npm_install()
    compose_exec("up -d")
    run("sleep 3")
    logs()

@task
def deploy():
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    deploy_worker()

@task
def deploy_clean():
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    env.sudo_password = PASSWORD

    env.warn_only = True
    undeploy_worker()
    sudo("rm -rf api")
    sudo("rm -rf dbgen")
    sudo("rm -rf docker")
    env.warn_only = False

    upload_all()
    deploy_worker()

###################

@task(alias="l")
def logs(service = ""):
    with cd(PATH_DOCKER):
        run("docker-compose logs --timestamps {service} | sort".format(service = service))

###################

def purge_db_worker():
    env.sudo_password = PASSWORD
    sudo("rm -rf /home/{USERNAME}/docker/volumes/db/data/pgdata".format(USERNAME=USERNAME))

@task
def purge_db():
    if not confirmn(USER_CONFIRMATION):
        abort(ABORT_MESSAGE)

    purge_db_worker()

###################

@task
def bootstrap():
    """
    Add usernames, SSH keys, disable root access, SSH only
    """
    # Log in as root for the first and last time
    env.user = "root"

    # Create user with same name as current system user
    run("useradd -d /home/{user} -m {user} -s /bin/bash".format(user=USERNAME))
    run("echo {user}:{password} | chpasswd".format(user=USERNAME, password=PASSWORD))
    run("usermod -aG sudo {user}".format(user=USERNAME))

    # Add public key to authorized keys
    public_key = "{home}/.ssh/id_rsa.pub".format(home=os.environ["HOME"])
    temp_key_path = "/home/{user}/.ssh/temp.key".format(user=USERNAME)
    run("mkdir /home/{user}/.ssh".format(user=USERNAME))
    put(public_key, temp_key_path)
    run("echo `cat {key}` >> /home/{user}/.ssh/authorized_keys".format(key=temp_key_path, user=USERNAME))
    run("rm {key}".format(key=temp_key_path))
    run("chmod 700 /home/{user}".format(user=USERNAME))
    run("chmod 700 /home/{user}/.ssh".format(user=USERNAME))
    run("chmod 600 /home/{user}/.ssh/authorized_keys".format(user=USERNAME))
    run("chown -R {user}:{user} /home/{user}/.ssh".format(user=USERNAME))

    # Update the system and install basic tools
    run("apt update")
    run("apt -y upgrade")

    # Enable firewall
    run("apt -y install ufw")
    run("ufw allow 22")
    run("ufw allow 10022")
    run("ufw allow 8080")
    run("ufw --force enable")

    # Secure the system a bit more, search for default ssh config patterns
    run("sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config")
    run("sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config")

    run("service sshd restart")

    # Install other software
    run("apt -y install tmux htop bash-completion subversion pigz psmisc ncdu bmon bonnie++ dos2unix hdparm iftop iptraf iotop iputils-tracepath man zip unzip lshw lsof mdadm manpages ntpdate p7zip realpath slurm smartmontools traceroute linux-tools-generic sysstat")

    # Install Docker
    run("apt -y install apt-transport-https ca-certificates curl software-properties-common")
    run("curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -")
    run('add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"')
    run("apt update")
    run("apt -y install docker-ce")
    run("usermod -aG docker {user}".format(user=USERNAME))

    # Install docker-compose
    ver_file = "/tmp/docker-compose-version"
    compose_bin = "/usr/local/bin/docker-compose"
    run('curl -s https://api.github.com/repos/docker/compose/releases/latest | grep "tag_name" | cut -d\\\\" -f4 > {ver_file}'.format(ver_file=ver_file))
    run("curl -L https://github.com/docker/compose/releases/download/`cat {ver_file}`/docker-compose-`uname -s`-`uname -m` > {compose_bin}".format(ver_file=ver_file, compose_bin=compose_bin))
    run("chmod +x {compose_bin}".format(compose_bin=compose_bin))
    run("curl -L https://raw.githubusercontent.com/docker/compose/`cat {ver_file}`/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose".format(ver_file=ver_file))
    run("rm {ver_file}".format(ver_file=ver_file))

    # System status check
    run("docker run hello-world")
    run("docker-compose -v")

#######################################################

@task
def whoami():
    env.user = "root"
    run("whoami")

