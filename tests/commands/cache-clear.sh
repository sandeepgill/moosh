#!/bin/bash -x 

source functions.sh
install_db
install_data
cd $MOODLEDIR

$MOOSHCMD cache-clear 

cd $MOODLEDATA/localcache
if find -name .lastpurged -cmin -1; then
  exit 0
else
  exit 1
fi
