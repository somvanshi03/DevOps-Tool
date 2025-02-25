# LVM 

## Key Concepts of LVM

	1. **Physical Volume (PV)**: A physical disk or partition that is used in LVM.
	2. **Volume Group (VG)**: A collection of physical volumes that can be allocated to logical volumes.
	3. **Logical Volume (LV)**: A virtual partition that can be resized and managed independently of the underlying physical storage.

## Installing LVM

	Before using LVM, ensure that the LVM package is installed. On most distributions, it is included by default, but you can install it using:


	# For Debian/Ubuntu
	sudo apt-get install lvm2

	# For Red Hat/CentOS
	sudo yum install lvm2
	

## Example: Setting Up LVM

## Step 1: Create Physical Volumes

	Assuming you have two disks, `/dev/sdb` and `/dev/sdc`, you can create physical volumes on them:

	
	sudo pvcreate /dev/sdb /dev/sdc


	You can verify the physical volumes created with:

	sudo pvdisplay
	

## Step 2: Create a Volume Group

	Next, create a volume group that includes the physical volumes:

	
	sudo vgcreate my_volume_group /dev/sdb /dev/sdc
	

	You can verify the volume group with:

	
	sudo vgdisplay
	

## Step 3: Create a Logical Volume

	Now, create a logical volume from the volume group. For example, to create a logical volume named `my_logical_volume` with a size of 50GB:

	
	sudo lvcreate -n my_logical_volume -L 50G my_volume_group
	

	You can verify the logical volume with:


	sudo lvdisplay
	

## Step 4: Format the Logical Volume

	Before using the logical volume, you need to format it with a filesystem. For example, to format it with the ext4 filesystem:

	
	sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume
	

## Step 5: Mount the Logical Volume

	Create a mount point and mount the logical volume:

	
	sudo mkdir /mnt/my_lvm
	sudo mount /dev/my_volume_group/my_logical_volume /mnt/my_lvm
	

	You can verify that it is mounted with:

	
	df -h
	

## Step 6: Resize the Logical Volume

	If you need to resize the logical volume, you can do so. For example, to increase the size to 100GB:

	1. First, ensure there is enough space in the volume group:

	  
	   sudo vgdisplay


	2. Resize the logical volume:

	  
	   sudo lvresize -L 100G /dev/my_volume_group/my_logical_volume
	   

	3. After resizing, you may need to resize the filesystem:

	   sudo resize2fs /dev/my_volume_group/my_logical_volume


## Step 7: Remove Logical Volume

	If you want to remove the logical volume, you can do so with:

	
	sudo lvremove /dev/my_volume_group/my_logical_volume
	

## Step 8: Remove Volume Group

	If you want to remove the volume group, ensure that all logical volumes are removed first, then:

	
	sudo vgremove my_volume_group
	

	#### Step 9: Remove Physical Volume

	Finally, if you want to remove the physical volumes, you can do so with:


	sudo pvremove /dev/sdb /dev/sdc


## Conclusion

	LVM provides a flexible and powerful way to manage disk storage in Linux. With LVM, you can easily create, resize, and manage logical volumes without the need to repartition disks. This makes it particularly useful for servers and systems that require dynamic storage management. Always ensure you have backups before making changes to your disk configurations.