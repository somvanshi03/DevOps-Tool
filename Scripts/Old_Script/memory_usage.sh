#!/bin/bash

# Define the application process names or service names
PROCESS_NAMES=("dotnet" "yourDotNetApp1" "yourDotNetApp2") # Replace with actual process names
SERVICE_NAMES=("yourDotNetService1" "yourDotNetService2") # Replace with actual service names if managed by systemd

# Define the memory threshold (in percentage)
MEMORY_THRESHOLD=70

# Function to get total system memory
get_total_memory() {
    awk '/MemTotal/ {print $2}' /proc/meminfo
}

# Function to get memory usage of a process by name
get_process_memory_usage() {
    local process_name=$1
    ps aux | grep "$process_name" | grep -v grep | awk '{sum+=$6} END {print sum}'
}

# Function to restart a service
restart_service() {
    local service_name=$1
    echo "Restarting service: $service_name..."
    sudo systemctl restart "$service_name"
    echo "$service_name restarted."
}

# Function to check and restart processes exceeding memory threshold
check_and_restart_processes() {
    local total_memory
    total_memory=$(get_total_memory)

    for process_name in "${PROCESS_NAMES[@]}"; do
        local memory_usage_kb
        memory_usage_kb=$(get_process_memory_usage "$process_name")
        
        if [[ -n "$memory_usage_kb" && "$memory_usage_kb" -gt 0 ]]; then
            local memory_usage_percent
            memory_usage_percent=$((memory_usage_kb * 100 / total_memory))
            
            echo "$process_name memory usage: $memory_usage_percent%"

            if [[ "$memory_usage_percent" -gt "$MEMORY_THRESHOLD" ]]; then
                local service_name
                service_name=$(systemctl list-units --type=service --state=running | grep "$process_name" | awk '{print $1}')

                if [[ -n "$service_name" ]]; then
                    restart_service "$service_name"
                else
                    echo "Service for $process_name not found or not running."
                fi
            fi
        else
            echo "Process $process_name not found."
        fi
    done
}

# Run the check and restart process
check_and_restart_processes

# Uncomment the following lines to run the script continuously with a delay
# while true; do
#     check_and_restart_processes
#     sleep 60 # Check every 60 seconds
# done
