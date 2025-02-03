# Linux Basic Commands
		

	clear or ctrl l -> clear the screen

	ls			    -> list content
	ls -l      		-> list content in long listing format
	ls -al			-> list all subcontent in long listing format
	ll			    -> an alias for the above 
	ls -R			-> list content recursively
	l.			    -> list hidden files
	ls -F			-> list content and classify them

	alias			    -> display all aliases for current user
	alias <statement>	-> make alias eg alias c='clear'
	unalias	<alias>		-> remove alias eg unalias c

	exit			    -> log out from the system
	logout			    - diito -
	^d                         - ditto -

	tree			-> list content in a tree (hierarchial) diagram
	tree -d			-> list subdirectories only - no files 
	tree -p			-> list content with their permissions

	cd <directory>		-> change directory to...
	cd ..			-> change to parent directory
	cd -			-> change to previous directory
	cd			    -> change to home directory
	cd ~			-^

	pwd			    -> print work (current) directory
	pwd -P			-> print parent working dir of this symlink dir

	mkdir <directory>	-> make directory
	mkdir -p <directory>	-> make parent directories also if it does not exist

	touch			-> make a 0 byte file if it does not exist 
							   or 
				   update date stamp of file if it exists

	cp			-> copy (for files)
	cp -a			-> copy (for directories)
	cp -p			-> copy and preserve date and time

	mv			-> move OR rename

	rmdir			-> remove empty directory
	rm			    -> remove 		(for files)
	rm -f			-> remove forcefully	( "    "  )	
	rm -r			-> remove recursively 		     (for directories)
	rm -rf			-> remove recursively and forcefully ( "       "     )


	cat			-> display content of the file
	cat -n			-> display content of the file and number the lines


	cal			-> display calendar for current month
	date			-> display system date and time
	date -s '<value>'	-> change system date and time in mm/dd/yy
	hwclock			-> display the hardware clock
	hwclock --hctosys	-> set the system time from the hardware clock

	ln -s			-> make a soft/sym/symbolic link
	ln			-> make a hard link

	history			-> display the list of the last 1000 commands
	! 100                   -> Run command 100 in history

	vi			-> text editor


	aspell -c <filename>	-> check the spelling in the file

	lynx			-> web browser
	lynx -dump <url>
	links			-^
	elinks			-^

	mtools
	======
	mdir
	mcopy
	mformat

	file			-> display the type of file
	which			-> display the path of the binary

	hostname		-> display system name with domain

	id			    -> display id info of current user
	id -u			-> display user id of current user
	id -un			-> display username of current user
	id -g			-> display group id of current user
	id -gn			-> display groupname of current user

	uptime			-> display for how long the system has been running
	tty			    -> display current terminal number


	users			-> display no. of users currently logged in
	whoami			-> display username of current user
	who			    -> display users logged in the system with their
							   respective terminals and time since logged in
	who am i		-> display current user, terminal and uptime
	w			    -> display is details which files are open on which
				   terminal
	finger
	finger <user>

	pinky
	pinky <user>


	ps			    -> display process status of current terminal
	ps -l			-> display process status of current terminal in detail
	ps -e			-> display process status of all terminals
	ps -el			-> display process status of all terminals in detail

	uname -s		-> display kernel name
	uname -r		-> display release
	uname -v		-> display version
	uname -p		-> display processor type
	uname -m		-> display machine type
	reset			-> reset the current terminal

	locate <file>   -> searches /var/lib/slocate/slocatedb
							   Use updatedb* to rebuild the database

	find <$file> -name <file>  eg find / -name dad -print       Find file "dad"
							   eg find / -name "dad*" -print    Find all files 
													starting with dad


	init 6			-> reboot the system
	reboot			-^
	shutdown -tx -r now	-^ where x is in seconds 
	shutdown +x             -^ where x is in minutes 

	init 0			-> shutdown system

	halt			-> halt the system after shutdown
	poweroff		-^



# Wild Cards
				   

	|		-> give output of one binary to another binary (pipe)
	| more		-> give output to more
	| less		-> give output to less
	| grep		-> search from the output of previous binary and display
					   (global regular expression print)
	q		-> quit
	>		-> overwrite
	>>		-> append
	-h		-> human readable
	wc		-> word count
	head		-> extract from the beginning
	tail		-> extract from the ending
	``		-> execute first
	man		-> display detail manual
	--help		-> display brief help
	nl		-> number the lines



# Magic Keys
				   

	Ctrl+c		-> cancel/quit process
	Ctrl+r		-> search command
	Ctrl+l		-> clear screen
	Ctrl+d		-> log out
	Ctrl+Alt+Delete	-> reboot
	Ctrl+u		-> copy line from cursor to beginnning
	Ctrl+y		-> paste
	Ctrl+m/j	-> execute / go / Enter / <-'
	Ctrl+s		-> scroll lock
	Ctrl+q		-> scroll unlock







	
