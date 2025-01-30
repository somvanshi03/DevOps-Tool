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

#########

##!/bin/bash

## Variables
#JENKINS_HOME="/var/lib/jenkins"  # Change this if your Jenkins home is in a different location
#BACKUP_DIR="/path/to/backup"      # Change this to your desired backup directory
#TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
#BACKUP_FILE="jenkins_backup_$TIMESTAMP.tar.gz"

## Create backup directory if it doesn't exist
#mkdir -p "$BACKUP_DIR"

## Create a backup
#echo "Starting backup of Jenkins server..."
#tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$JENKINS_HOME" .

#if [ $? -eq 0 ]; then
#    echo "Backup successful! Backup file is located at: $BACKUP_DIR/$BACKUP_FILE"
#else
#    echo "Backup failed!"
#    exit 1
#fi

## Optional: Remove backups older than 7 days
#find "$BACKUP_DIR" -name "jenkins_backup_*.tar.gz" -type f -mtime +7 -exec rm {} \;

#echo "Old backups cleaned up."