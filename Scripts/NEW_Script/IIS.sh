#!/bin/bash
#SVN-Server Backup Script...!!!

echo "Mounting Remote Drive..."

/bin/mount -t cifs //192.168.0.150/d/WebSites /mnt/Backup -o username=administrator,password=Admin@123,domain=WORKGROUP,iocharset=utf8,file_mode=0775,dir_mode=0775
sleep 2

echo "Drive Mounted Successfully.."

sleep 2

echo "Starting Backup..."

sleep 30

cd /mnt

CUR_DATE=`date +%Y%m%d`

echo "Creating tar file Please wait..."

tar -zcvf /storage/Backup/150IIS_Backup/150IIS_Backup_$CUR_DATE.tgz Backup

echo "Successfully created tar file..."

df -h /dev/sda1 > /root/bin/svn

mail -s "SVN-Server Backup" admin@abc.com < /root/bin/svn

sleep 2

/bin/umount /mnt/Backup

echo "Drive umounted successfully...!!"
