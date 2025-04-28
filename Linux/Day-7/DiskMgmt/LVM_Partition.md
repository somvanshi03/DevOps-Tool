# LVM

## Step-by-Step Guide to Create an LVM Partition with 10GB Disk Space

1. **Identify the Disk:**
   First, identify the disk you want to use. You can list all disks using:
   
   lsblk
   

2. **Create a Physical Volume (PV):**
   Use the `pvcreate` command to initialize the disk as a physical volume. Replace `/dev/sdb` with your actual disk.
   
   sudo pvcreate /dev/sdb
  

3. **Create a Volume Group (VG):**
   Create a volume group that will contain the physical volume. You can name it anything you like; here, we will call it `my_volume_group`.
   
   sudo vgcreate my_volume_group /dev/sdb
   

4. **Create a Logical Volume (LV):**
   Now, create a logical volume of 10GB within the volume group. You can name the logical volume anything you like; here, we will call it `my_logical_volume`.
   
   sudo lvcreate -n my_logical_volume -L 10G my_volume_group
   

5. **Format the Logical Volume:**
   Format the logical volume with a filesystem. Here, we will use `ext4` as an example.
   
   sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume
   

6. **Create a Mount Point:**
   Create a directory where you will mount the logical volume.
   
   sudo mkdir /mnt/my_mount_point
   

7. **Mount the Logical Volume:**
   Mount the logical volume to the directory you just created.
   
   sudo mount /dev/my_volume_group/my_logical_volume /mnt/my_mount_point
   

8. **Verify the Mount:**
   You can verify that the logical volume is mounted correctly by using:
   
   df -h
   

9. **Make the Mount Permanent (Optional):**
   If you want the logical volume to be mounted automatically at boot, you need to add an entry to `/etc/fstab`. Open the file with a text editor:
   
   sudo nano /etc/fstab
   
   Add the following line at the end of the file:
   
   /dev/my_volume_group/my_logical_volume /mnt/my_mount_point ext4 defaults 0 2
   
   Save and exit the editor.

## Summary of Commands
Here’s a summary of the commands you would run:

sudo pvcreate /dev/sdb
sudo vgcreate my_volume_group /dev/sdb
sudo lvcreate -n my_logical_volume -L 10G my_volume_group
sudo mkfs.ext4 /dev/my_volume_group/my_logical_volume
sudo mkdir /mnt/my_mount_point
sudo mount /dev/my_volume_group/my_logical_volume /mnt/my_mount_point


## Important Notes
- Ensure that the disk you are using (`/dev/sdb` in this example) is not in use and does not contain any important data, as these commands will overwrite it.
- Adjust the names of the volume group and logical volume as needed for your environment.
- If you are using an existing disk with data, you may need to resize or remove existing partitions to create space for LVM.