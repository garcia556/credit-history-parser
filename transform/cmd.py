import logging
LOG_FORMAT = '%(asctime)-15s - %(levelname)s: %(message)s'

import sys
from lib import transform

logging.basicConfig(filename = "cmd.log", filemode = "a", level = logging.INFO, format = LOG_FORMAT)

if len(sys.argv) < 4:
    logging.error("Parameters set incorrectly, usage: cmd.py ${REQUEST_ID} ${XML_TYPE} ${XML_FILE_PATH}")
    sys.exit(1)

rid			= sys.argv[1]
xml_type	= sys.argv[2]
path		= sys.argv[3]

logging.info("{0}: Got new \"{1}\" request, file \"{2}\"".format(rid, xml_type, path))

f = open(path, "r", encoding = "utf-8")
xml_str = f.read()
xml_str_b = xml_str.encode()
f.close()

xml_res_str = transform(xml_type, xml_str_b)

print(xml_res_str)
