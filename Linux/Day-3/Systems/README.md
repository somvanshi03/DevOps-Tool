# System Info

	In Linux, system information commands allow you to retrieve various details about the system, including hardware, software, and performance metrics. Below are some commonly used commands to gather system information, along with examples.

## 1. `uname` - Print system information

	The `uname` command provides basic information about the system, including the kernel name, version, and architecture.

	- **Display the kernel name:**
	
	uname
	
	Example Output:
	
	Linux
	

	- **Display all system information (kernel, hostname, etc.):**
	
	uname -a
	
	Example Output:
	
	Linux myhostname 5.4.0-42-generic #46-Ubuntu SMP Thu Jul 9 00:10:00 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
	
	This output shows the kernel version, hostname, architecture, and more.

## 2. `hostname` - Show or set the system's hostname

	The `hostname` command displays the name of the system or allows you to set it.

	- **Display the current hostname:**
	
	hostname
	
	Example Output:
	
	myhostname
	

	- **Display the fully qualified domain name (FQDN):**
	
	hostname -f
	
	Example Output:
	
	myhostname.local


## 3. `uptime` - Show how long the system has been running

	The `uptime` command displays how long the system has been running, along with the current time, number of users, and system load.

	- **Display uptime:**
	
	uptime
	
	Example Output:
	
	 09:12:05 up 10 days,  3:21,  2 users,  load average: 0.14, 0.10, 0.12
	

## 4. `top` - Display dynamic real-time system information

	The `top` command provides a real-time view of system processes, CPU usage, memory usage, and more.

	- **Display real-time system information:**
	
	top
	
	Inside `top`, you can see:
	- Process ID (PID)
	- CPU usage
	- Memory usage
	- Load average
	- Running processes

	- **Quit `top`:**
	Press `q` to exit.

## 5. `free` - Display memory usage

	The `free` command shows memory usage (RAM) and swap space on the system.

	- **Display memory usage:**

	free
	
	Example Output:
	
				  total        used        free      shared  buff/cache   available
	Mem:           7982         1299        5592         108         1090        6276
	Swap:          2047           0        2047
	

	- **Display memory usage in a human-readable format:**

	free -h
	
	Example Output:

				  total        used        free      shared  buff/cache   available
	Mem:           7.8Gi       1.3Gi       5.5Gi       108Mi       1.1Gi       6.1Gi
	Swap:          2.0Gi          0B       2.0Gi
	

## 6. `df` - Display disk space usage

	The `df` command shows the amount of disk space used and available on all mounted filesystems.

	- **Display disk space usage:**
	
	df
	
	Example Output:
	
	Filesystem     1K-blocks    Used Available Use% Mounted on
	/dev/sda1       10240000  250000  9000000  25% /
	/dev/sdb1        5120000  120000  5000000   3% /mnt/data
	

	- **Display disk space in human-readable format (e.g., GB, MB):**
	
	df -h
	
	Example Output:
	
	Filesystem      Size  Used Avail Use% Mounted on
	/dev/sda1        10G  250M  9.0G   3% /
	/dev/sdb1       4.9G  120M  4.8G   3% /mnt/data
	

## 7. `lscpu` - Display CPU architecture information

	The `lscpu` command provides detailed information about the CPU architecture, including the number of CPUs, cores, threads, and more.

	- **Display CPU information:**
	
	lscpu
	
	Example Output:
	
	Architecture:        x86_64
	CPU op-mode(s):      32-bit, 64-bit
	Byte Order:          Little Endian
	CPU(s):              4
	On-line CPU(s) list: 0-3
	Thread(s) per core:  2
	Core(s) per socket:  2
	Socket(s):           1
	

## 8. `lspci` - List all PCI devices

	The `lspci` command lists all PCI devices (like network cards, graphic cards, storage controllers, etc.).

	- **List all PCI devices:**
	
	lspci
	
	Example Output:
	
	00:00.0 Host bridge: Intel Corporation 6th Gen Core Processor Host Bridge/DRAM Registers (rev 09)
	00:02.0 VGA compatible controller: Intel Corporation Skylake Integrated Graphics (rev 07)
	

## 9. `lsusb` - List all USB devices

	The `lsusb` command lists all USB devices connected to the system.

	- **List all USB devices:**
	
	lsusb
	
	Example Output:
	
	Bus 002 Device 004: ID 0781:5591 SanDisk Corp. Cruzer Blade
	Bus 002 Device 003: ID 0bda:58f5 Realtek Semiconductor Corp. 
	

## 10. `dmidecode` - Display detailed hardware information

	The `dmidecode` command provides detailed information about the system's hardware (such as the BIOS version, memory, and CPU).

	- **Display detailed system hardware information:**
	
	sudo dmidecode
	
	**Example Output:**
	
	Handle 0x0001, DMI type 1, 27 bytes
	System Information
		Manufacturer: Dell Inc.
		Product Name: XPS 15 9570
		Version: 1.0
		Serial Number: ABC123XYZ


## 11. `watch` - Execute a command periodically
	The `watch` command runs a command repeatedly and displays the output in real-time. It’s useful for monitoring system parameters.

	- **Monitor system load every 2 seconds:**
	
	watch -n 2 uptime
	
	This will show the uptime and system load every 2 seconds.

## 12. `cat /proc/cpuinfo` - Display CPU details

	The `/proc/cpuinfo` file contains detailed information about the CPU.

	- **Display detailed CPU information:**
	
	cat /proc/cpuinfo
	
	Example Output:
	
	processor   : 0
	vendor_id   : GenuineIntel
	cpu family  : 6
	model       : 158
	model name  : Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz


## 13. `cat /proc/meminfo` - Display memory details

	The `/proc/meminfo` file provides detailed information about the system's memory.

	- **Display detailed memory information:**

	cat /proc/meminfo
	
	Example Output:

	MemTotal:       8192340 kB
	MemFree:        5590212 kB
	MemAvailable:   6276492 kB
	Buffers:         101672 kB
	



## Summary of Common Linux System Info Commands:

	| Command                | Description                                      | Example |
	|------------------------|--------------------------------------------------|---------|
	| `uname -a`             | Display detailed system information             | `uname -a` |
	| `hostname`             | Display system hostname                         | `hostname` |
	| `uptime`               | Show system uptime and load averages            | `uptime` |
	| `top`                  | Display real-time system information            | `top` |
	| `free -h`              | Display memory usage in human-readable format   | `free -h` |
	| `df -h`                | Display disk space usage in human-readable format | `df -h` |
	| `lscpu`                | Display CPU architecture information            | `lscpu` |
	| `lspci`                | List all PCI devices                            | `lspci` |
	| `lsusb`                | List all USB devices                            | `lsusb` |
	| `dmidecode`            | Display detailed hardware information           | `sudo dmidecode` |
	| `watch`                | Execute a command periodically                  | `watch -n 2 uptime` |
	| `cat /proc/cpuinfo`    | Display detailed CPU information                | `cat /proc/cpuinfo` |
	| `cat /proc/meminfo`    | Display detailed memory information             | `cat /proc/meminfo` |

	These commands will help you gather detailed information about your system, including hardware, software, memory, and performance metrics.