# Disk Management

## 1. **Viewing Disk Information**

	You can use the `lsblk` command to list all block devices (disks and partitions):

	
	lsblk
	

	This will show you a tree-like structure of your disks and their partitions.

## 2. **Partitioning Disks**

	To partition disks, you can use tools like `fdisk` for MBR (Master Boot Record) or `gdisk` for GPT (GUID Partition Table). Here’s an example using `fdisk`.

## Example: Using `fdisk`

	1. Open the terminal and run `fdisk` on the desired disk (e.g., `/dev/sda`):

	  
	   sudo fdisk /dev/sda
	  

	2. Inside the `fdisk` prompt, you can use the following commands:
	
	   - `m` for help
	   - `p` to print the partition table
	   - `n` to create a new partition
	   - `d` to delete a partition
	   - `w` to write changes and exit

	3. To create a new partition:
	   - Type `n`, then choose the partition type (primary or extended), and specify the partition number and size.

	4. After making changes, type `w` to write the changes to the disk.

## 3. **Formatting Partitions**

	After creating a partition, you need to format it with a filesystem. Common filesystems include ext4, xfs, and ntfs.

## Example: Formatting a Partition

	To format a partition (e.g., `/dev/sda1`) with the ext4 filesystem:

	
	sudo mkfs.ext4 /dev/sda1
	

## 4. **Mounting Filesystems**

	Once a partition is formatted, you need to mount it to access it.

## Example: Mounting a Partition

	1. Create a mount point (directory):

	   
	   sudo mkdir /mnt/mydata
	   

	2. Mount the partition:

	  
	   sudo mount /dev/sda1 /mnt/mydata
	   

	3. To verify that it is mounted, you can use:

	
	   df -h
	   

## 5. **Unmounting Filesystems**

	To unmount a filesystem, use the `umount` command.

## Example: Unmounting a Partition


	sudo umount /mnt/mydata
	

## 6. **Managing Disk Space**

	You can check disk usage with the `df` command and find out which files are using space with `du`.

	#### Example: Checking Disk Usage

	
	df -h
	

## Example: Checking Directory Size

	To check the size of a directory:

	
	du -sh /path/to/directory
	

## 7. **Using `parted` for Advanced Partitioning**

	For more advanced partitioning tasks, you can use `parted`.

## Example: Using `parted`

	1. Start `parted` on the disk:

	  
	   sudo parted /dev/sda
	  

	2. Inside the `parted` prompt, you can use commands like:
	   - `print` to show the partition table
	   - `mkpart` to create a new partition
	   - `rm` to remove a partition
	   - `quit` to exit

## Conclusion

	Disk management in Linux is a powerful feature that allows you to control how your storage is organized and utilized. The commands and tools mentioned above are fundamental for managing disks and partitions effectively. Always ensure you have backups before making changes to disk partitions or filesystems to avoid data loss.