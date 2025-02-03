# User and Group

	In Linux, managing **users** and **groups** is an essential part of system administration. 
	Here are the key commands for handling users and groups:

## **User Commands**

	1. **`whoami`**  
	   - Displays the username of the currently logged-in user.
	   - Example:
		
		 whoami
		 
		 Output:
		 
		 user1
		 

	2. **`id`**  
	   - Displays the user ID (UID), group ID (GID), and associated groups for the current user.
	   - Example:
		
		 id
		 
		 Output:
		 
		 uid=1001(user1) gid=1001(user1) groups=1001(user1),27(sudo)
		 

	3. **`useradd`**  
	   - Adds a new user to the system.
	   - Example:
		 
		 sudo useradd username
		
	   - Optionally, you can create a home directory or set a password when adding a user:
		
		 sudo useradd -m -s /bin/bash username
		 sudo passwd username
		 

	4. **`usermod`**  
	   - Modifies an existing user's details (e.g., changing their home directory or group).
	   - Example:  
		 To add a user to a group:
		 
		 sudo usermod -aG groupname username
		 

	5. **`userdel`**  
	   - Deletes a user account from the system.
	   - Example:
		
		 sudo userdel username
		 
	   - To remove the user and their home directory:
		 
		 sudo userdel -r username
		 

	6. **`passwd`**  
	   - Changes the password for a user account.
	   - Example:

		 sudo passwd username
		
	   - To change your own password, just use `passwd`.

	7. **`chsh`**  
	   - Changes the default shell for a user.
	   - Example:
		 
		 sudo chsh -s /bin/zsh username
		 

	### **Group Commands**

	1. **`groupadd`**  
	   - Creates a new group.
	   - Example:
		
		 sudo groupadd groupname
		 

	2. **`groupdel`**  
	   - Deletes a group.
	   - Example:
		 
		 sudo groupdel groupname
		 

	3. **`groupmod`**  
	   - Modifies an existing group (e.g., changing the group name or GID).
	   - Example:  
		 To rename a group:
		 
		 sudo groupmod -n newgroupname oldgroupname
		 

	4. **`gpasswd`**  
	   - Administers a group password (primarily used for managing group memberships).
	   - Example:  
		 To add a user to a group:
		 
		 sudo gpasswd -a username groupname
		 
	   - To remove a user from a group:
		 
		 sudo gpasswd -d username groupname
		 

	5. **`groups`**  
	   - Displays the groups a user belongs to.
	   - Example:
		 
		 groups username
		 
		 Output:
		 
		 username : group1 group2
		 

	6. **`newgrp`**  
	   - Changes the current group ID during a session.
	   - Example:
		 
		 newgrp groupname
		

	### **Viewing User and Group Information**

	1. **`cat /etc/passwd`**  
	   - Displays a list of all user accounts on the system, along with their UID, GID, home directory, and shell.
	   - Example:
		
		 cat /etc/passwd
		 

	2. **`cat /etc/group`**  
	   - Displays a list of all groups on the system and their members.
	   - Example:
		 
		 cat /etc/group
		 

	3. **`getent`**  
	   - Retrieves entries from system databases, such as user and group information.
	   - Example (to view user info):
		 
		 getent passwd username
		 
	   - Example (to view group info):
		 
		 getent group groupname
		 

	### **Changing Ownership and Permissions**

	1. **`chown`**  
	   - Changes the owner and/or group of a file or directory.
	   - Example:
		 
		 sudo chown username:groupname file.txt
		 
	   - To change only the owner:
		 
		 sudo chown username file.txt
		 

	2. **`chgrp`**  
	   - Changes the group ownership of a file or directory.
	   - Example:
		 
		 sudo chgrp groupname file.txt
		 

### **Summary of Important Commands:**

	- **Add a user**: `sudo useradd username`
	- **Delete a user**: `sudo userdel username`
	- **Modify user**: `sudo usermod -aG groupname username`
	- **Create a group**: `sudo groupadd groupname`
	- **Delete a group**: `sudo groupdel groupname`
	- **Change user password**: `sudo passwd username`
	- **List groups**: `groups username`
	- **Change file ownership**: `sudo chown username:groupname file.txt`

	These commands are used for managing users, groups, and file permissions in Linux systems. Do you need more details or examples for a specific task?