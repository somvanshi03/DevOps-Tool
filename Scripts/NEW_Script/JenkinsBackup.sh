### Backup of jenkins Server

#!/bin/bash

#variable
JENKINS_HOME="/var/lib/jenkins"
BACKUP_DIR="/Jenkins_Backup_Path/"
DATE=$(date +%y-%m-%d)
BACKUP_FILE="$BACKUP_DIR/Jenkins_backup_$DATE.tar.tz"
mkdir -p $BACKUP_DIR
tar -cvzf $BACKUP_FILE -C $JENKINS_HOME jobs
echo "Backup Completed: $BACKUP_FILE"
