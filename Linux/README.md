# Command
## 1. File and Directory Management

	ls – List directory contents
	
	cd – Change directory
	
	pwd – Print working directory
	
	cp – Copy files and directories
	
	mv – Move or rename files and directories
	
	rm – Remove files or directories
	
	mkdir – Make directories
	
	rmdir – Remove empty directories
	
	touch – Change file timestamps or create empty files
	
	find – Search for files in a directory hierarchy
	
	locate – Find files by name
	
	tree – Display directories in a tree-like format
	
	chmod – Change file permissions
	
	chown – Change file owner and group
	
	chgrp – Change group ownership
	
	stat – Display file or file system status


## 2. File Viewing and Editing

	cat – Concatenate and display file content
	
	tac – Concatenate and display file content in reverse
	
	more – View file content interactively (page by page)
	
	less – View file content interactively (scrollable)
	
	head – Output the first part of a file
	
	tail – Output the last part of a file
	
	nano – Text editor (terminal-based)
	
	vim / vi – Advanced text editors
	
	emacs – Text editor
	
	grep – Search text using patterns
	
	sed – Stream editor for filtering and transforming text
	
	awk – Pattern scanning and processing language
	
	cut – Remove sections from each line of files
	
	sort – Sort lines of text files





## 3. Process Management

	ps – Report a snapshot of current processes
	
	top – Display Linux tasks
	
	htop – Interactive process viewer (advanced top)
	
	kill – Send a signal to a process, typically to terminate
	
	killall – Terminate processes by name
	
	bg – Resume a suspended job in the background
	
	fg – Bring a job to the foreground
	
	jobs – List active jobs
	
	nice – Run a program with modified scheduling priority
	
	renice – Alter priority of running processes
	
	uptime – Show how long the system has been running
	
	time – Measure program running time




## 4. Disk Management

	df – Report file system disk space usage
	
	du – Estimate file space usage
	
	fdisk – Partition table manipulator for Linux
	
	lsblk – List information about block devices
	
	mount – Mount a file system
	
	umount – Unmount a file system
	
	parted – A partition manipulation program
	
	mkfs – Create a file system
	
	fsck – File system consistency check and repair
	
	blkid – Locate/print block device attributes




## 5. Networking

	ifconfig – Configure network interfaces
	
	ip – Show/manipulate routing, devices, and tunnels
	
	ping – Send ICMP Echo requests to network hosts
	
	netstat – Network statistics
	
	ss – Socket statistics (faster than netstat)
	traceroute – Trace the route packets take to a network host
	
	nslookup – Query Internet name servers interactively
	
	dig – DNS lookup utility
	
	wget – Non-interactive network downloader
	
	curl – Transfer data with URLs
	
	scp – Secure copy files between hosts
	
	ssh – Secure shell for remote login
	
	ftp – File Transfer Protocol client




## 6. User and Group Management

	useradd – Add a user to the system
	
	usermod – Modify a user account
	
	userdel – Delete a user account
	
	groupadd – Add a group to the system
	
	groupdel – Delete a group
	
	passwd – Change user password
	
	chage – Change user password expiry information
	
	whoami – Print the current logged-in user
	
	who – Show who is logged in
	
	w – Show who is logged in and what they’re doing
	
	id – Display user and group information
	
	groups – Show user’s groups





## 7. System Information and Monitoring

	uname – Print system information
	
	hostname – Show or set the system’s hostname
	
	uptime – How long the system has been running
	
	dmesg – Boot and system messages
	
	free – Display memory usage
	
	top – Display Linux tasks
	
	vmstat – Report virtual memory statistics
	
	lscpu – Display information about the CPU architecture
	
	lsusb – List USB devices
	
	lspci – List PCI devices
	
	lshw – List hardware configuration




## 8. Archiving and Compression

	tar – Archive files
	
	tar -czf archive.tar.gz /path/to/directory – Compress files using gzip
	
	tar -xzf archive.tar.gz – Extract gzipped tarball
	
	tar -cf archive.tar /path/to/directory – Create a tarball
	
	tar -xf archive.tar – Extract tarball
	
	zip – Package and compress files into a ZIP archive
	
	unzip – Extract files from a ZIP archive
	
	gzip – Compress files using the gzip algorithm
	
	gunzip – Decompress files compressed with gzip
	
	bzip2 – Compress files using the bzip2 algorithm
	
	bunzip2 – Decompress files compressed with bzip2
	
	xz – Compress files using the xz algorithm
	
	unxz – Decompress files compressed with xz




## 9. Package Management (Depends on Distribution)

### Debian-based (e.g., Ubuntu)

	apt-get – APT package handling utility
	
	apt-get install <package> – Install a package
	
	apt-get update – Update package list
	
	apt-get upgrade – Upgrade installed packages
	
	apt-get remove <package> – Remove a package
	
	apt-cache – Query APT cache
	
	apt-cache search <package> – Search for a package
	
	apt-cache show <package> – Show package details

### Red Hat-based (e.g., CentOS, Fedora)

	yum – Package manager for RPM-based systems
	
	yum install <package> – Install a package
	
	yum update – Update installed packages
	
	yum remove <package> – Remove a package
	
	dnf – Next-generation package manager (Fedora, CentOS 8+)
	
	dnf install <package> – Install a package
	
	dnf update – Update installed packages
	
	dnf remove <package> – Remove a package

### General Commands

	rpm – RPM package manager
	
	rpm -i <package.rpm> – Install an RPM package
	
	rpm -e <package> – Remove an RPM package
	
	dpkg – Debian package manager
	
	dpkg -i <package.deb> – Install a Debian package
	
	dpkg -r <package> – Remove a Debian package





## 10. System Services and Daemon Management

	systemctl – Control the systemd system and service manager
	
	systemctl start <service> – Start a service
	
	systemctl stop <service> – Stop a service
	
	systemctl restart <service> – Restart a service
	
	systemctl enable <service> – Enable a service to start on boot
	
	systemctl disable <service> – Disable a service from starting on boot
	
	systemctl status <service> – Check service status
	
	service – Older service management command (used in non-systemd systems)
	
	service <service> start – Start a service
	
	service <service> stop – Stop a service
	
	service <service> restart – Restart a service
	
	service <service> status – Check service status





## 11. Scheduling Tasks

	cron – Daemon for running scheduled commands
	
	crontab -e – Edit cron jobs for the current user
	
	crontab -l – List the current user’s cron jobs
	
	crontab -r – Remove the current user's cron jobs
	
	at – Run commands at a specified time
	
	at 09:00 – Schedule a command to run at 09:00 AM
	
	batch – Run commands when the system load is low
	
	sleep – Delay for a specified time
	
	sleep 5s – Sleep for 5 seconds




## 12. File Permissions and Security

	chmod – Change file permissions
	
	chown – Change file owner and group
	
	chgrp – Change the group ownership of a file
	
	umask – Set default permissions for new files
	
	setfacl – Set file access control lists (ACL)
	
	getfacl – Get file access control lists (ACL)
	
	sudo – Execute a command as another user (usually root)
	
	visudo – Edit the sudoers file safely
	
	passwd – Change a user’s password
	
	sudoers – Manage sudo access for users
	
	gpasswd – Administer group password
	
	ss – Display socket statistics (for secure network connections)



## 13. System Backup and Restore

	rsync – Remote file and directory synchronization
	
	rsync -avz source/ destination/ – Synchronize files
	
	rsync -avz -e ssh source/ user@remote:/destination/ – Sync over SSH
	
	cpio – Copy files to and from archives
	
	dd – Low-level copying and backup of entire filesystems
	
	dd if=/dev/sda of=/path/to/backup.img – Backup a disk/partition
	
	dd if=/path/to/backup.img of=/dev/sda – Restore a disk/partition




## 14. System Diagnostics and Troubleshooting

	dmesg – Print the kernel ring buffer messages (system boot and hardware-related messages)
	
	journalctl – Query and view logs from systemd’s journal
	
	strace – Trace system calls and signals
	
	strace <command> – Trace a command’s system calls
	
	lsof – List open files (useful for debugging)
	
	lsof <file> – Show processes using a specific file
	
	vmstat – Report virtual memory statistics
	
	iostat – Report CPU and I/O statistics
	
	mpstat – Report CPU usage statistics
	
	pidstat – Report statistics by process
	
	free – Display memory usage
	
	uptime – How long the system has been running
	
	watch – Execute a program periodically, showing output
	
	watch -n 1 free – Watch memory usage every second
	
	lshw – List hardware configuration
	
	htop – Interactive process viewer (better than top)
	
	netstat – Network statistics (deprecated in favor of ss)
	
	ss – Show socket statistics (more efficient than netstat)



## 15. Networking & Remote Management

	ifconfig – Configure network interfaces (older command, replaced by ip)
	
	ip – A more modern alternative for managing network interfaces and routing
	
	ip addr – Show IP addresses
	
	ip link – Show or manipulate network interfaces
	
	ip route – Show or manipulate routing tables
	
	ss – Display socket statistics (useful for diagnosing network issues)
	
	nmap – Network exploration tool (can be used for security auditing)
	
	telnet – User interface to the TELNET protocol (less common nowadays)
	
	nc (Netcat) – Network utility for reading and writing from network connections
	
	nc -l -p 1234 – Listen on port 1234
	
	nc <host> <port> – Connect to a host and port
	
	iptables – Administration tool for IPv4 packet filtering and NAT(Network Address Translation)
	
	firewalld – Frontend for managing firewall rules (used in some distros like Fedora and CentOS)
	
	ufw – Uncomplicated firewall (front-end for iptables)
	
	ufw enable – Enable firewall
	
	ufw allow <port> – Allow traffic on a specific port
	
	tcpdump – Command-line packet analyzer
	
	curl – Transfer data from or to a server using various protocols(HTTP, FTP, etc.)
	
	wget – Download files from the web via HTTP, HTTPS, FTP
	
	scp – Secure copy over SSH (used to copy files between systems)
	
	scp file.txt user@remote:/path/to/destination/ – Copy file to remote server
	
	rsync – Remote file and directory synchronization (often used for backups)
	
	rsync -avz /local/path/ remote:/remote/path/ – Sync directories