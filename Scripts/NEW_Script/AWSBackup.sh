#!/bin/bash
latest_file=`ls -lrth /storage/Backup/SVN_Backup/Repositories_*.tgz | tail -1 | awk '{print $9}'`
aws s3 cp $latest_file s3://mumbaigitsvnbackup/SVN/
mail -s "SVN Backup uploaded to S3Bucket" devsecops@abc.com 
