#!/bin/sh
# /etc/cron.monthly/standard: standard monthly maintenance script

# delete files older than 10 days from SVN Backup
/usr/bin/find /storage/Backup/SVN_Backup/ -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from UCM Backup
/usr/bin/find /storage/Backup/UCM_Backup/ -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from 134DXEngageIIS Backup
/usr/bin/find /storage/Backup/IIS134Backup/ -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from 134DXEngageDB Backup
/usr/bin/find /storage/Backup/134DB_Backup/  -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from 28DB Backup
/usr/bin/find /storage/Backup/28DB_Backup/  -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from150 IIS  Backup
/usr/bin/find /storage/Backup/150IIS_Backup/  -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from 96 IIS Backup
/usr/bin/find /storage/Backup/96IIS_Backup/  -type f -mtime +10 -exec rm {} +

# delete files older than 15 days from 37DB Backup
/usr/bin/find /storage/Backup/37DB_Backup/  -type f -mtime +10 -exec rm {} +
