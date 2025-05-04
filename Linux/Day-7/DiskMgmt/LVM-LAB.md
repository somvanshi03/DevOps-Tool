# LVM

	lsblk
	
	cat /etc/fstab
	
	df -h

	lsblk

	mkdir /data
	
	fdisk /dev/sdc
	
	mkfs /dev/sdc

	sudo pvcreate /dev/sdc

	sudo vgcreate my_volume_group /dev/sdc
	
	sudo lvcreate -n my_logical_volume -L 10G my_volume_group
	
	sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume
	
	sudo mkdir /mnt/my_mount_point
	
	sudo mount /dev/my_volume_group/my_logical_volume /mnt/my_mount_point
	
	df -h
	
	vi /etc/fstab

	lvdisplay

	vgdisplay

	lvextend -L +10G /dev/my_volume_group/my_logical_volume
	
	resize2fs /dev/my_volume_group/my_logical_volume
	
	lvdisplay
	
	xfs_growfs /dev/my_volume_group/my_logical_volume