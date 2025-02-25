# CronTab 

## Basic Syntax of Crontab

	The basic syntax for a crontab entry is as follows:

	
	* * * * * command_to_execute
	- - - - -
	| | | | |
	| | | | +---- Day of the week (0 - 7) (Sunday is both 0 and 7)
	| | | +------ Month (1 - 12)
	| | +-------- Day of the month (1 - 31)
	| +---------- Hour (0 - 23)
	+------------ Minute (0 - 59)
	

## How to Use Crontab

## 1. **Open the Crontab File**

	To edit the crontab file for the current user, use the following command:

	
	crontab -e
	

	This will open the crontab file in the default text editor (usually `vi` or `nano`).

## 2. **Add a Cron Job**

	Here are some examples of cron jobs you might add to the crontab file:

	- **Run a script every day at 2 AM:**

	
	0 2 * * * /path/to/your/script.sh
	

	- **Run a command every hour:**

	
	0 * * * * /usr/bin/some_command


	- **Run a script every Monday at 5 PM:**

	
	0 17 * * 1 /path/to/your/script.sh
	

	- **Run a command every 15 minutes:**

	
	*/15 * * * * /usr/bin/some_command
	

	- **Run a script on the 1st of every month at midnight:**

	
	0 0 1 * * /path/to/your/script.sh
	

## 3. **Save and Exit**

	After adding your cron jobs, save the file and exit the editor. In `nano`, you can do this by pressing `CTRL + X`, then `Y` to confirm changes, and `Enter` to save.

## 4. **List Current Cron Jobs**

	To view the current user's cron jobs, you can use:

	
	crontab -l
	

## 5. **Remove a Cron Job**

	To remove the current user's crontab, you can use:


	crontab -r
	

## Example: Creating a Cron Job

	Let’s say you want to create a cron job that backs up a directory every day at 3 AM.

	1. **Open the Crontab File:**

	
	crontab -e
	

	2. **Add the Cron Job:**

	
	0 3 * * * /usr/bin/tar -czf /path/to/backup/backup_$(date +\%Y\%m\%d).tar.gz /path/to/directory
	

	This command will create a compressed tarball of the specified directory and save it in the backup directory with a date-stamped filename.

	3. **Save and Exit:**

	Save the changes and exit the editor.

## Checking Cron Job Logs

	Cron jobs typically log their output to the system log. You can check the logs to see if your cron jobs are running as expected. On many systems, you can view the logs using:

	
	grep CRON /var/log/syslog
	

	Or, on some systems:

	
	cat /var/log/cron
	

## Conclusion

	`crontab` is a powerful tool for automating tasks in Linux. By scheduling cron jobs, you can ensure that routine tasks are performed without manual intervention. Always remember to check your cron job logs to troubleshoot any issues that may arise.