##UCM-Server Backup Script...!!!

echo "Mounting Remote Drive..."

mount -t nfs 192.168.0.52:/ucmSharedDisk /mnt
sleep 2

echo "Drive Mounted Successfully.."

sleep 2

echo "Starting Backup..."

sleep 30

cd /mnt/

CUR_DATE=`date +%Y%m%d`

echo "Creating tar file Please wait..."

tar -zcvf /storage/Backup/UCM_Backup/ucmSharedDisk_$CUR_DATE.tgz ucm/

echo "Successfully created tar file..."

df -h /dev/sda1 > /root/bin/svn

mail -s "ucmSharedDisk(192.168.1.102) Backup" devsecops@abc.com < /root/bin/svn

sleep 2

/bin/umount /mnt/

echo "Drive umounted successfully...!!"
