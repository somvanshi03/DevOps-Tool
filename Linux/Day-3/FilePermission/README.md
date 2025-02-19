# File Permission

## Overview of File Permissions

	In Linux, each file and directory has associated permissions that determine who can read, write, or execute them. Permissions are represented in a symbolic format (using letters) and a numeric format (using numbers).

## Viewing Permissions

	You can view the permissions of files and directories using the `ls -l` command. Here’s an example:


	$ ls -l
	total 12
	-rw-r--r-- 1 alice staff  4096 Oct  1 12:00 file1.txt
	-rwxr-xr-- 1 bob   staff  2048 Oct  1 12:01 script.sh
	drwxr-xr-x 2 charlie staff 4096 Oct  1 12:02 mydir
	

## Breakdown of the Output

	- **File Type**: The first character indicates the type:
	  - `-` for a regular file
	  - `d` for a directory
	- **Permissions**: The next nine characters are divided into three groups:
	  - **Owner permissions**: `rw-` (read and write)
	  - **Group permissions**: `r--` (read only)
	  - **Others permissions**: `r--` (read only)

## Example 1: Changing Permissions with `chmod`

## Scenario

	Suppose you have a file named `script.sh` that you want to make executable by everyone.

## Current Permissions

	
	$ ls -l script.sh
	-rwxr-xr-- 1 bob staff 2048 Oct  1 12:01 script.sh
	

## Command to Change Permissions

	To add execute permission for others, you can use:

	
	chmod o+x script.sh
	

## Updated Permissions

	Now, if you check the permissions again:

	
	$ ls -l script.sh
	-rwxr-xr-x 1 bob staff 2048 Oct  1 12:01 script.sh
	

## Example 2: Changing Permissions with Numeric Method

	## Scenario

	You want to set the permissions of `file1.txt` to read and write for the owner, and read-only for the group and others.

## Current Permissions

	
	$ ls -l file1.txt
	-rw-r--r-- 1 alice staff 4096 Oct  1 12:00 file1.txt


## Command to Change Permissions

	You can use the numeric method:

	
	chmod 644 file1.txt
	

## Updated Permissions

	Check the permissions again:

	
	$ ls -l file1.txt
	-rw-r--r-- 1 alice staff 4096 Oct  1 12:00 file1.txt
	

	(Note: In this case, the permissions remain the same because `644` is already the current permission.)

## Example 3: Changing Ownership with `chown`

## Scenario

	You want to change the owner of `file1.txt` from `alice` to `bob`.

## Command to Change Ownership

	
	chown bob file1.txt
	

## Updated Ownership

	Check the ownership:

	
	$ ls -l file1.txt
	-rw-r--r-- 1 bob staff 4096 Oct  1 12:00 file1.txt
	

## Example 4: Special Permissions

## Setuid Example

	Suppose you have a program `program` that you want to run with the permissions of its owner.

	1. **Set the Setuid Bit**:

	
	chmod u+s program
	

	2. **Check Permissions**:

	
	$ ls -l program
	-rwsr-xr-x 1 root staff 4096 Oct  1 12:00 program
	

	The `s` in the owner's permission indicates that the setuid bit is set.

## Setgid Example

	For a directory `mydir`, you want new files created in it to inherit the group of `mydir`.

	1. **Set the Setgid Bit**:

	
	chmod g+s mydir
	

	2. **Check Permissions**:

	
	$ ls -ld mydir
	drwxr-sr-x 2 charlie staff 4096 Oct  1 12:02 mydir
	

	The `s` in the group's permission indicates that the setgid bit is set.

## Sticky Bit Example

	For a directory `/tmp`, you want to set the sticky bit so that only the file owner can delete their files.

	1. **Set the Sticky Bit**:

	
	chmod +t /tmp
	

	2. **Check Permissions**:

	
	$ ls -ld /tmp
	drwxrwxrwt 10 root root 4096 Oct  1 12:00 /tmp
	