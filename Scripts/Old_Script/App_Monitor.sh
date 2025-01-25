#!/bin/bash

# Set the threshold for memory usage (in percentage)
threshold=65

# Set the name of the process/service to monitor
service_name="DX.UI"

# Get the PID of the service
pid=`ps -ef | grep $service_name | grep -v grep | awk '{print $2}'`



# Get the memory usage of the service
memory_usage=$(ps -p $pid -o %mem | awk 'NR==2{print $1}')

# Check if memory usage exceeds the threshold
if (( $(echo "$memory_usage > $threshold" | bc -l) )); then
    echo "Memory usage of $service_name exceeds $threshold% ($memory_usage%). Restarting service..."

    # Restart the service

    sh /webapp/stopUI
        sh /webapp/startUI
    echo "Service restarted."
        echo "UI Server restarted because of high memory utiliation `date`" >> /webapp/highuitilization_restart.log
else
    echo "Memory usage of $service_name is within acceptable limits ($memory_usage%)."
fi
