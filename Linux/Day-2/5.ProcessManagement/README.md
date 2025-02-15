# Process management

	In Linux, process management commands are used to view, control, and manage running processes. Below are some commonly used commands for process management, along with examples.

## 1. `ps` - Display information about running processes

	The `ps` command displays information about active processes.

	- **Display all running processes for the current user:**
	
	ps
	

	- **Display all processes running on the system (including others):**
	
	ps -e
	

	- **Display detailed information about all processes:**
	```bash
	ps -ef
	```

	- **Display processes with hierarchical relationships (tree view):**
	
	ps -ejH
	

	- **Display processes with additional information (like CPU and memory usage):**
	
	ps aux
	

## 2. `top` - Display dynamic real-time process information

	The `top` command shows a real-time, continuously updated list of processes on the system. This includes CPU and memory usage, process IDs (PIDs), and more.

	- **Run the `top` command:**
	
	top
	
	Once inside `top`, you can:
	  - Press `q` to quit.
	  - Press `P` to sort by CPU usage.
	  - Press `M` to sort by memory usage.

## 3. `htop` - Interactive process viewer (requires installation)

	`htop` is an enhanced version of `top`, offering an interactive, colorful, and user-friendly process viewer. It provides better navigation and control over processes.

	- **Run `htop`:**
	
	htop
	
	Once inside `htop`, you can:
	  - Press `F9` to kill a process.
	  - Press `F10` to quit.
	  - Use arrow keys to navigate between processes.

	If `htop` is not installed, you can install it using:
	
	sudo apt install htop   # On Debian-based systems
	sudo yum install htop   # On Red Hat-based systems
	

## 4. `kill` - Send a signal to terminate a process

	The `kill` command is used to send signals to processes. The most common use is to send a `SIGTERM` signal to terminate a process.

	- **Kill a process by PID (process ID):**
	
	kill PID
	
	Example:
	
	kill 1234
	
	This sends the default `SIGTERM` signal to the process with PID `1234`, requesting it to terminate.

	- **Force kill a process (use `SIGKILL` signal):**
	
	kill -9 PID
	
	Example:
	
	kill -9 1234
	
	This will forcefully kill the process with PID `1234`.

## 5. `pkill` - Kill processes by name

	The `pkill` command sends a signal to processes based on their name or other attributes.

	- **Kill processes by name:**
	
	pkill process_name
	
	Example:
	
	pkill firefox
	
	This will terminate all processes with the name `firefox`.

	- **Force kill processes by name:**
	
	pkill -9 process_name
	

## 6. `killall` - Kill all processes by name

	The `killall` command kills all processes by the given name. It can be used to terminate multiple processes with the same name.

	- **Kill all processes by name:**
	
	killall process_name
	
	Example:
	
	killall firefox
	
	This will terminate all processes with the name `firefox`.

	- **Force kill all processes by name:**
	
	killall -9 process_name
	

## 7. `nice` - Start a process with a modified priority

	The `nice` command is used to start a process with a modified scheduling priority. A higher nice value means a lower priority.

	- **Start a process with a specified priority (default nice value is 0):**
	
	nice -n 10 command
	
	Example:
	
	nice -n 10 sleep 60
	
	This will start the `sleep` command with a nice value of 10, lowering its priority.

	- **Start a process with a negative nice value (higher priority):**
	
	sudo nice -n -10 command
	

## 8. `renice` - Change the priority of an already running process

	The `renice` command is used to change the priority (nice value) of an existing process.

	- **Change the priority of a running process:**
	
	renice -n 10 -p PID
	
	Example:
	
	renice -n 10 -p 1234
	
	This will change the nice value of the process with PID `1234` to 10 (lower priority).

	- **Increase priority of a process (negative nice value):**
	
	sudo renice -n -5 -p 1234
	

## 9. `bg` - Resume a suspended process in the background

	The `bg` command is used to resume a stopped process in the background.

	- **Resume a suspended process:**
	
	bg %job_number
	
	Example:
	
	bg %1
	
	This resumes job number 1 in the background.

## 10. `fg` - Bring a background process to the foreground

	The `fg` command brings a background process to the foreground.

	- **Bring a background process to the foreground:**
	
	fg %job_number
	
	Example:
	
	fg %1
	

## 11. `jobs` - List background and suspended jobs

	The `jobs` command lists all jobs running in the current shell session.

	- **List current jobs:**
	
	jobs
	

	### Summary of Commands:

	| Command   | Description                                   | Example |
	|-----------|-----------------------------------------------|---------|
	| `ps`      | Display information about running processes  | `ps -ef` |
	| `top`     | Display real-time process information        | `top` |
	| `htop`    | Interactive process viewer (requires install) | `htop` |
	| `kill`    | Terminate a process by PID                   | `kill 1234` |
	| `pkill`   | Kill processes by name                       | `pkill firefox` |
	| `killall` | Kill all processes by name                   | `killall firefox` |
	| `nice`    | Start a process with a modified priority     | `nice -n 10 sleep 60` |
	| `renice`  | Change the priority of an existing process   | `renice -n 10 -p 1234` |
	| `bg`      | Resume a suspended process in the background | `bg %1` |
	| `fg`      | Bring a background process to the foreground | `fg %1` |
	| `jobs`    | List background and suspended jobs           | `jobs` |

	These process management commands are essential for monitoring, controlling, and managing processes in a Linux environment.