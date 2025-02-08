#!/bin/bash

# Function to print the header
print_header() {
    printf "%-15s %-20s %-10s %-30s %-25s\n" "Instance ID" "Instance Type" "State" "Launch Time" "Availability Zone"
    printf "%-15s %-20s %-10s %-30s %-25s\n" "------------" "--------------" "-----" "----------" "----------------"
}

# Function to fetch instances based on state
fetch_instances() {
    local state=$1
    echo "Fetching $state instances..."
    
    # Get instances in the specified state
    instances=$(aws ec2 describe-instances --filters "Name=instance-state-name,Values=$state" --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,LaunchTime,Placement.AvailabilityZone]' --output json)

    # Check if there are any instances
    if [ "$(echo "$instances" | jq '. | length')" -eq 0 ]; then
        echo "No $state instances found."
        return
    fi

    # Print instances in a formatted way
    echo "$instances" | jq -r '.[][] | @tsv' | while IFS=$'\t' read -r instance_id instance_type state launch_time availability_zone; do
        printf "%-15s %-20s %-10s %-30s %-25s\n" "$instance_id" "$instance_type" "$state" "$launch_time" "$availability_zone"
    done
}

# Print the header
print_header

# Fetch running and stopped instances
fetch_instances "running"
fetch_instances "stopped"