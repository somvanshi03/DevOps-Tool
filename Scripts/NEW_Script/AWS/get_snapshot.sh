#!/bin/bash

# Function to print the header
print_header() {
    printf "%-20s %-20s %-10s %-30s %-25s %-15s\n" "Snapshot ID" "Volume ID" "State" "Start Time" "Availability Zone" "Region"
    printf "%-20s %-20s %-10s %-30s %-25s %-15s\n" "------------" "---------" "-----" "----------" "----------------" "------"
}

# Function to fetch snapshots for a given region
fetch_snapshots() {
    local region=$1
    echo "Fetching snapshots in region: $region"
    
    # Get snapshots in the specified region
    snapshots=$(aws ec2 describe-snapshots --owner-ids self --region "$region" --query 'Snapshots[*].[SnapshotId,VolumeId,State,StartTime,VolumeAvailabilityZone]' --output json)

    # Check if there are any snapshots
    if [ "$(echo "$snapshots" | jq '. | length')" -eq 0 ]; then
        echo "No snapshots found in region: $region"
        return
    fi

    # Print snapshots in a formatted way
    echo "$snapshots" | jq -r --arg region "$region" '.[] | @tsv' | while IFS=$'\t' read -r snapshot_id volume_id state start_time availability_zone; do
        printf "%-20s %-20s %-10s %-30s %-25s %-15s\n" "$snapshot_id" "$volume_id" "$state" "$start_time" "$availability_zone" "$region"
    done
}

# Print the header
print_header

# Get all available regions
regions=$(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text)

# Loop through each region and fetch snapshots
for region in $regions; do
    fetch_snapshots "$region"
done