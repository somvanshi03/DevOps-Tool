### Apache2 or Httpd Thread Count Monitoring
#!/bin/bash

SERVICE_NAME="httpd"
THREAD_THRESHOLD=900

while true; do 

	THREAD_COUNT=$(ps -efL | grep $SERVICE_NAME |wc -l)
	if [ $THREAD_COUNT -gt $THREAD_THRESHOLD ]; then
	systemctl restart $SERVICE_NAME
	fi
	sleep 60

done

##!/bin/bash

## Get the current thread count
#THREAD_COUNT=$(ps -C httpd --no-headers | wc -l)

## Define the threshold
#THRESHOLD=900

## Check if the thread count exceeds the threshold
#if [ "$THREAD_COUNT" -gt "$THRESHOLD" ]; then
#    echo "Thread count ($THREAD_COUNT) exceeds threshold ($THRESHOLD). Restarting httpd..."
#    systemctl restart httpd
#    echo "httpd restarted."
#else
#    echo "Thread count ($THREAD_COUNT) is within the limit."
#fi