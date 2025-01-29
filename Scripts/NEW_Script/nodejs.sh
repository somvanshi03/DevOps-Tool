#!/bin/bash

SERVICE_NAME="your-DotnetCore-Service"
CPU_THRESHOLD=90
MEM_THRESHOLD=90

while true; do 

	PID=$pgrep -f $SERVICE_NAME
	if [ -z "$PID" ]; then
		echo "service $SERVICE_NAME not running"
	else
	   
	   CPU_USAGE=$(ps -p $PID -o %cpu=)
	   MEM_USAGE=$(ps -p $PID -o %mem=)
	   
	 if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l ) )) || (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) ));
	 systemctl restart $SERVICE_NAME
	
	fi
	sleep 60

done