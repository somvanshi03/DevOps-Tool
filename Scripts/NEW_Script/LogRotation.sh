#!/bin/bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
cd /var/log
cp lastlog lastlog0$TIMESTAMP
cp /dev/null lastlog

#######

find /var/log -type f -mtime +7 -exec rm {} \;


