#!/bin/bash

# load env file into the script's environment.
source env.sh

# exec to container
docker exec $(docker ps -q -f name=$HOST) \
		mysql -u root --password=$PASS --port=$PORT \
		--execute="mysql -f -u root -p $DB_NAME < $DB_NAME.sql"