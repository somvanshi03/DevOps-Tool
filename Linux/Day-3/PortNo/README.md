# PortNo

	In Linux, you can check which ports are open, which processes are using them, and more using several commands. Here are the most common methods for checking ports:

## 1. `netstat` - Network Statistics

	The `netstat` command provides detailed information about network connections, routing tables, and listening ports.

	- **List all open ports and their associated processes:**
	
	netstat -tuln
	
	Explanation:
	- `-t`: Show TCP connections.
	- `-u`: Show UDP connections.
	- `-l`: Show only listening sockets.
	- `-n`: Show numerical addresses and port numbers (instead of resolving names).

	**Example Output:**
	
	Proto Recv-Q Send-Q Local Address           Foreign Address         State
	tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN
	tcp6       0      0 :::80                   :::*                    LISTEN
	
	This shows that port `22` is open for SSH and port `80` is open for HTTP.

## 2. `ss` - Socket Stat

	The `ss` command is used to display socket statistics. It's more modern and faster than `netstat`.

	- **List all listening ports:**
	
	ss -tuln
	

	Explanation:
	- `-t`: Show TCP sockets.
	- `-u`: Show UDP sockets.
	- `-l`: Show only listening sockets.
	- `-n`: Show numerical addresses and port numbers.

	**Example Output:**
	
	Netid  State      Recv-Q Send-Q   Local Address:Port       Peer Address:Port
	tcp    LISTEN     0      128      0.0.0.0:22              0.0.0.0:*
	tcp    LISTEN     0      128      [::]:80                 [::]:*
	
	This indicates that ports `22` and `80` are listening.

## 3. `lsof` - List Open Files

	The `lsof` command lists open files and the processes that opened them, including network connections (sockets).

	- **List all open ports:**
	
	lsof -i -P -n
	
	Explanation:
	- `-i`: Show all network-related files.
	- `-P`: Show port numbers instead of service names.
	- `-n`: Do not resolve IP addresses to hostnames.

	**Example Output:**
	
	COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
	sshd     1234 root    3u  IPv4  12345      0t0  TCP *:22 (LISTEN)
	apache2  5678 www-data 10u  IPv6  67890      0t0  TCP *:80 (LISTEN)
	
	This shows that port `22` is open by the `sshd` process, and port `80` is open by `apache2`.

## 4. `fuser` - Identify Processes Using a Specific Port

	You can use the `fuser` command to check which processes are using a specific port.

	- **Check which process is using a specific port (e.g., port 80):**

	fuser 80/tcp
	

	**Example Output:**

	80/tcp:            5678
	
	This shows that the process with PID `5678` is using port `80`.

## 5. `nmap` - Network Mapper (for remote servers)

	If you want to check which ports are open on a remote system, you can use the `nmap` tool.

	- **Scan a specific IP address to find open ports:**
	
	nmap 192.168.1.1
	

	- **Scan a specific range of ports:**
	
	nmap -p 1-1000 192.168.1.1
	

	- **Scan all ports:**
	
	nmap -p- 192.168.1.1
	

	**Example Output:**
	
	Starting Nmap 7.80 ( https://nmap.org ) at 2025-02-15 09:30 PST
	Nmap scan report for 192.168.1.1
	Host is up (0.0034s latency).
	Not shown: 999 closed ports
	PORT   STATE SERVICE
	22/tcp open  ssh
	80/tcp open  http
	443/tcp open https
	
	This shows that ports `22`, `80`, and `443` are open on the remote server `192.168.1.1`.

	---

## Summary:

	- **`netstat -tuln`**: Shows all listening ports and associated processes.
	- **`ss -tuln`**: A faster alternative to `netstat` for viewing open ports.
	- **`lsof -i -P -n`**: Lists open files and network connections.
	- **`fuser <port>/tcp`**: Identifies processes using a specific port.
	- **`nmap`**: Scans for open ports on remote servers.

	These commands help you check which ports are in use on your system and which services are running on them.