#!/bin/bash

# load env file into the script's environment.
source env.sh

# exec to container
docker exec $(docker ps -q -f name=$HOST) \
		mysql -u root --password=$PASS --port=$PORT \
		--execute="mysqldump -u root -p $DB_NAME -R -E --triggers --routines --single-transaction > $DB_NAME.sql"