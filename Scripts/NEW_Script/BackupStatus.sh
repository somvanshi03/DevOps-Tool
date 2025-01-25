#!/bin/bash
ls -lrht /storage/Backup/IIS134Backup/
ls -lrht /storage/Backup/134DB_Backup/
ls -lrht /storage/Backup/28DB_Backup/
ls -lrht /storage/Backup/SVN_Backup/
ls -lrht /storage/Backup/150IIS_Backup/
ls -lrht /storage/Backup/96IIS_Backup/
ls -lrht /storage/Backup/UCM_Backup/
ls -lrht /Storage/Backup/37DB_Backup/
df -hT
aws s3 ls s3://mumbaigitsvnbackup/SVN/
