import boto3
import pandas as pd

def get_snapshots_by_region_and_az():
    # Create a session using your AWS credentials
    session = boto3.Session()
    
    # Get a list of all available regions for EC2
    ec2_client = session.client('ec2', region_name='us-east-1')  # Use any region to get the list of regions
    regions = ec2_client.describe_regions()['Regions']
    
    snapshots_data = []

    # Iterate through each region
    for region in regions:
        region_name = region['RegionName']
        print(f"Fetching snapshots in region: {region_name}")
        
        # Create an EC2 client for the current region
        ec2_client = session.client('ec2', region_name=region_name)
        
        # Describe snapshots
        snapshots = ec2_client.describe_snapshots(OwnerIds=['self'])  # Get snapshots owned by the account
        
        # Iterate through each snapshot
        for snapshot in snapshots['Snapshots']:
            snapshot_id = snapshot['SnapshotId']
            volume_id = snapshot['VolumeId']
            state = snapshot['State']
            start_time = snapshot['StartTime']
            availability_zone = snapshot['VolumeAvailabilityZone']
            
            # Append the snapshot data to the list
            snapshots_data.append({
                'Snapshot ID': snapshot_id,
                'Volume ID': volume_id,
                'State': state,
                'Start Time': start_time,
                'Availability Zone': availability_zone,
                'Region': region_name
            })

    # Create a DataFrame from the snapshots data
    df = pd.DataFrame(snapshots_data)
    
    # Display the DataFrame in a tabular format
    print(df.to_string(index=False))

if __name__ == "__main__":
    get_snapshots_by_region_and_az()