#!/bin/bash
set -e

DB_DATABASE="${DB_USER}"
DB_ROLE="${DB_USER}_owner"
DB_SCHEMA_DWH="dwh"

echo "Starting database init script"

# look for the database
if grep -q ${DB_DATABASE} $(psql -lqt | cut -d \| -f 1); then
	DB_EXISTS="1"
fi

if [ ! -z "$DB_EXISTS" ]; then
	echo "Database already exists, skipping ..."
# database does not exist
else
	echo "Database does not exist ..."

	SQL="/tmp/apply.sql"
	echo "\\set ON_ERROR_STOP on"														>  ${SQL}

	# system
	echo "CREATE USER ${DB_USER}     WITH PASSWORD '${DB_PASSWORD}';"					>> ${SQL}
	echo "CREATE ROLE ${DB_ROLE};"														>> ${SQL}
	echo "GRANT ${DB_ROLE} TO ${DB_USER};"												>> ${SQL}

	echo "CREATE USER ${DB_USER_RO}  WITH PASSWORD '${DB_PASSWORD_RO}';"				>> ${SQL}

	echo "CREATE DATABASE ${DB_DATABASE} OWNER ${DB_ROLE};"								>> ${SQL}

	# database-related
	echo "\\c ${DB_DATABASE};"															>> ${SQL}

	echo "CREATE EXTENSION \"uuid-ossp\";"												>> ${SQL}

	echo "CREATE SCHEMA ${DB_SCHEMA_DWH};"												>> ${SQL}
	echo "ALTER SCHEMA ${DB_SCHEMA_DWH} OWNER TO ${DB_ROLE};"							>> ${SQL}

	echo "GRANT USAGE ON SCHEMA public				TO ${DB_USER_RO};"					>> ${SQL}
	echo "GRANT USAGE ON SCHEMA ${DB_SCHEMA_DWH}	TO ${DB_USER_RO};"					>> ${SQL}

	# show resulting SQL
	echo "================================================"
	echo "SQL:"
	cat ${SQL}
	echo "================================================"

	# execute
	psql --file="${SQL}"
	rm ${SQL}

	echo "Applying diff scripts ..."
	echo "================================================"
	for f in /sql/*; do
		echo "Processing file ${f}"
		psql --username="${DB_USER}" --dbname="${DB_DATABASE}" --file="${f}"
		echo "================================================"
	done

	# grant table permissions after diff files where they are actually created first
	psql --dbname="${DB_DATABASE}" --command="GRANT SELECT ON ALL TABLES IN SCHEMA ${DB_SCHEMA_DWH}	TO ${DB_USER_RO};"
	psql --dbname="${DB_DATABASE}" --command="GRANT SELECT ON ALL TABLES IN SCHEMA public			TO ${DB_USER_RO};"
fi

