## Monitor DotnetCore Service based on Memory and CPU utilizaion
#!/bin/bash

SERVICE_NAME="your-DotnetCore-Service"
CPU_THRESHOLD=90
MEM_THRESHOLD=90

while true; do 

	CPU_USAGE=$(top -b -n 1 -p $(pgrep -d ',' -f $ SERVICE_NAME) |awk '/%Cpu/{print $2}')
	MEM_USAGE=$(top -b -n 1 -p $(pgrep -d ',' -f $ SERVICE_NAME) |awk '/%KiB Mem/{print $2}')
	
	if (( $(echo "$CPU_THRESHOLD" | bc -l ) )) || ((  ($echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
	 systemctl restart $SERVICE_NAME
	
	fi
	sleep 60

done


##!/bin/bash

## Get the CPU and memory usage
#CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
#MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

## Define the threshold
#THRESHOLD=90

## Check if CPU or memory usage exceeds the threshold
#if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )) || (( $(echo "$MEMORY_USAGE > $THRESHOLD" | bc -l) )); then
#    echo "CPU usage ($CPU_USAGE%) or Memory usage ($MEMORY_USAGE%) exceeds threshold ($THRESHOLD%). Restarting .NET Core service..."
#    systemctl restart your_dotnetcore_service_name
#    echo ".NET Core service restarted."
#else
#    echo "CPU usage ($CPU_USAGE%) and Memory usage ($MEMORY_USAGE%) are within the limits."
#fi

