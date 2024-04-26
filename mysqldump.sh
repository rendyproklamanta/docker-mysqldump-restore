#!/bin/bash

# load env file into the script's environment.
source env.sh

echo 
echo "Dumping $DB_NAME has started"
echo

# exec to container
docker exec -e DB_HOST=$DB_HOST -e DB_PORT=$DB_PORT -e DB_PASS=$DB_PASS -e DB_NAME=$DB_NAME $(docker ps -q -f name=$DB_HOST) sh -c 'mysqldump -P $DB_PORT -u root -p $DB_PASS $DB_NAME -R -E --triggers --routines --single-transaction --quick | gzip -9 > $DB_NAME.sql.gz'

# copy file from container to local machine
docker cp $(docker ps -q -f name=$DB_HOST):/$DB_NAME.sql.gz .

echo 
echo "Dumping $DB_NAME finished"
echo