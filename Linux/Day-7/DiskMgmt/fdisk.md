# FDISK

## Basic Usage of `fdisk`

	1. **Open `fdisk` on a Disk**

	   To start using `fdisk`, you need to specify the disk you want to manage. For example, to manage the first hard disk (`/dev/sda`):

	   ```bash
	   sudo fdisk /dev/sda
	   ```

	2. **View the Partition Table**

	   Once inside the `fdisk` prompt, you can view the current partition table by typing:

	   ```bash
	   p
	   ```

	   This will display the existing partitions on the disk, including their sizes, types, and other details.

## Common `fdisk` Commands

	Here are some common commands you can use within the `fdisk` prompt:

	- **`m`**: Display help.
	- **`p`**: Print the partition table.
	- **`n`**: Add a new partition.
	- **`d`**: Delete a partition.
	- **`t`**: Change a partition's system ID.
	- **`w`**: Write changes to the disk and exit.
	- **`q`**: Quit without saving changes.

## Example: Creating a New Partition

	1. **Start `fdisk`**

	   Open the terminal and run:

	   ```bash
	   sudo fdisk /dev/sda
	   ```

	2. **Print the Current Partition Table**

	   Type `p` and press Enter to see the current partitions:

	   ```
	   Command (m for help): p
	   ```

	3. **Create a New Partition**

	   Type `n` to create a new partition:

	   ```
	   Command (m for help): n
	   ```

	   - You will be prompted to choose between a primary or extended partition. For example, type `p` for primary.
	   - Next, you will be asked for the partition number (1-4 for primary partitions). If you have existing partitions, choose the next available number.
	   - Specify the first sector (you can press Enter to accept the default).
	   - Specify the last sector or size (e.g., `+10G` for a 10 GB partition).

	4. **Print the Partition Table Again**

	   After creating the partition, you can print the partition table again to verify:

	   ```
	   Command (m for help): p
	   ```

	5. **Write Changes to Disk**

	   If everything looks good, type `w` to write the changes to the disk:

	   ```
	   Command (m for help): w
	   ```

	   This will save the changes and exit `fdisk`.

## Example: Deleting a Partition

	1. **Start `fdisk`**

	   Open the terminal and run:

	   ```bash
	   sudo fdisk /dev/sda
	   ```

	2. **Print the Current Partition Table**

	   Type `p` to see the current partitions:

	   ```
	   Command (m for help): p
	   ```

	3. **Delete a Partition**

	   Type `d` to delete a partition:

	   ```
	   Command (m for help): d
	   ```

	   - You will be prompted to enter the partition number you want to delete. Enter the number of the partition you wish to remove.

	4. **Print the Partition Table Again**

	   After deleting the partition, you can print the partition table again to verify:

	   ```
	   Command (m for help): p
	   ```

	5. **Write Changes to Disk**

	   If everything looks good, type `w` to write the changes to the disk:

	   ```
	   Command (m for help): w
	   ```

## Important Notes

	- **Backup Data**: Always ensure you have backups of important data before modifying partitions, as mistakes can lead to data loss.
	- **Unmount Partitions**: If you are modifying a partition that is currently mounted, you may need to unmount it first using the `umount` command.
	- **Use with Caution**: `fdisk` is a powerful tool, and incorrect usage can lead to data loss or system instability. Always double-check your commands.

## Conclusion

	The `fdisk` command is a versatile tool for managing disk partitions in Linux. By following the examples above, you can create, delete, and manage partitions effectively. Always proceed with caution and ensure you have backups before making changes to your disk.