#!/bin/bash

# load env file into the script's environment.
source env.sh

# copy file from local machine into container
docker cp $DB_NAME.sql.gz $(docker ps -q -f name=$DB_HOST):/

echo 
echo "Import $DB_NAME has started"
echo

# exec to container
docker exec -e DB_HOST=$DB_HOST -e DB_PORT=$DB_PORT -e DB_PASS=$DB_PASS -e DB_NAME=$DB_NAME $(docker ps -q -f name=$DB_HOST) sh -c 'gunzip -c /$DB_NAME.sql.gz | mysql -P $DB_PORT -u root -p $DB_PASS $DB_NAME'

echo 
echo "Import $DB_NAME finished"
echo