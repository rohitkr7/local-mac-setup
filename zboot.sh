#!/bin/bash

# Description: This script is used to reset the database to the initial state
echo '############################################## ZBooting the Local Setup ##############################################'

currentDBName="glide_xanadu"
dumpFileName="glide_xanadu_with_devops.sql"

echo "Do you want to apply dump file with Devops plugins? (Y/N) <Press Enter for Y>:"
read decision
if [ "$decision" == "N" ] || [ "$decision" == "n" ]; then
  dumpFileName="glide_xanadu.sql"
else
  dumpFileName="glide_xanadu_with_devops.sql"
fi

echo "Dump File Selected :::: ~/Documents/dbdump/$dumpFileName"

## Drop the DB
echo '############################################## DROPING THE DB ...........................................'
mysql -u root -e "DROP DATABASE IF EXISTS $currentDBName;"
if [ $? -ne 0 ]; then
  echo '############################################## DROP FAILED ###########################################'
  exit 1
fi
echo '############################################## DROP SUCCESSFUL ##########################################'

## Recreate the DB
echo '############################################## RECREATING THE DB ........................................'
mysql -u root -e "CREATE DATABASE glide_xanadu;"
if [ $? -ne 0 ]; then
  echo '############################################## RECREATE FAILED ######################################'
  exit 1
fi
echo '############################################## RECREATE SUCCESSFUL ######################################'

## Apply existing db dump
echo '######################################### APPLYING EXISTING DB DUMP .....................................'
mysql -u root glide_xanadu < ~/Documents/dbdump/$dumpFileName
if [ $? -ne 0 ]; then
  echo '######################################### APPLY EXISTING DB DUMP FAILED ##################################'
  exit 1
fi
echo '######################################### ZBOOT SUCCESSFUL ##################################'
exit 0


echo '######################################### LAUNCHING LOCALHOST  ##################################'
gll start
