#!/bin/bash

# Function to display top 10 CPU and Memory utilization
display_cpu_memory_usage() {
    echo -e "\nTop 10 CPU and Memory Utilization:"
    printf "%-10s %-10s %-30s %-10s %-10s\n" "PID" "PPID" "COMMAND" "%MEM" "%CPU"
    echo "---------------------------------------------------------------"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11 | awk '{printf "%-10s %-10s %-30s %-10s %-10s\n", $1, $2, $3, $4, $5}'
}

# Function to display disk IOPS usage
display_disk_iops_usage() {
    echo -e "\nDisk IOPS Usage:"
    printf "%-10s %-10s %-10s %-10s %-10s\n" "Device" "tps" "kB_read/s" "kB_wrtn/s" "kB_read" "kB_wrtn"
    echo "---------------------------------------------------------------"
    iostat -x 1 2 | awk 'NR>3 {printf "%-10s %-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $5, $6}' | head -n -1
}

# Function to display network in/out with bandwidth usage
display_network_usage() {
    echo -e "\nNetwork In/Out with Bandwidth Usage:"
    printf "%-20s %-15s %-15s\n" "Interface" "RX (bytes)" "TX (bytes)"
    echo "---------------------------------------------------------------"
    ifstat -S 1 1 | awk 'NR==3 {printf "%-20s %-15s %-15s\n", $1, $2, $3}'
}

# Main function to call all the display functions
main() {
    display_cpu_memory_usage
    display_disk_iops_usage
    display_network_usage
}

# Execute the main function
main