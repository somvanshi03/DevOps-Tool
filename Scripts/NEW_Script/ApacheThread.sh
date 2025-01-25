### Script: monitor_apache_threads.sh

#!/bin/bash

# Configuration
APACHE_PROCESS_NAME="apache2"  # Use "httpd" for CentOS/RHEL
LOG_FILE="/var/log/monitor_apache_threads.log"
RESTART_COMMAND="sudo systemctl restart apache2"  # Use "sudo systemctl restart httpd" for CentOS/RHEL
THREAD_THRESHOLD=500

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a $LOG_FILE
}

# Function to get the Apache thread count
get_apache_thread_count() {
    pgrep $APACHE_PROCESS_NAME | xargs ps -o nlwp= -p | awk '{ sum += $1 } END { print sum }'
}

# Function to restart Apache
restart_apache() {
    log_message "Apache thread count exceeded threshold. Attempting to restart..."
    $RESTART_COMMAND
    if [ $? -eq 0 ]; then
        log_message "Apache successfully restarted."
    else
        log_message "Failed to restart Apache."
    fi
}

# Main monitoring loop
while true; do
    THREAD_COUNT=$(get_apache_thread_count)
    log_message "Current Apache thread count: $THREAD_COUNT"
    if [ "$THREAD_COUNT" -gt "$THREAD_THRESHOLD" ]; then
        restart_apache
    fi
    sleep 60  # Check every 60 seconds
done




