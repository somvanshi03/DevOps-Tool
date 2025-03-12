# AWS CLI 

## List of Region

	aws help
	
	aws ec2 help
	
	aws ec2 describe-regions
	
	aws ec2 describe-regions --all-regions
	
	aws ec2 describe-regions --all-regions --output table
	
	aws ec2 describe-regions  --query "Regions[].{Name:RegionName}"
	
	aws ec2 describe-regions  --query "Regions[].{Name:RegionName}" --output table 
	
	aws ec2 describe-regions --output text
	
	aws ec2 describe-regions --output text | cut -f3
		
## List of Availability Zone
	
	aws ec2 describe-availability-zones
	
	aws ec2 describe-availability-zones --output table
	
	aws ec2 describe-availability-zones --region ap-south-1
	
	aws ec2 describe-availability-zones --region ap-south-1 --output table 
		

## EC2:

	EC2 Help
	
	aws ec2 help 
	
## List of VPC:

	aws ec2 describe-vpcs --output table

## List of Subnets:

	aws ec2 describe-subnets --output table

## List of SecurityGroup:

	aws ec2 describe-security-groups
	
	aws ec2 describe-security-groups --output table

## List of KeyPairs:

	aws ec2 describe-key-pairs
	aws ec2 describe-key-pairs --output table
	
## List of AMIs:


	aws ec2 describe-images --owners self amazon  --output table
	
	aws ec2 describe-images --executable-users all
	
	aws ec2 describe-images --executable-users all  --output table
	
	aws ec2 describe-images --owners ubuntu aws-marketplace
	
	aws ec2 describe-images --output text
	
	aws ec2 describe-images --owners amazon aws-marketplace --query 'Images[*].[ImageId]' --output text
	
	aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn*" --query 'sort_by(Images, &CreationDate)[].Name'
	
	aws ec2 describe-images --owners amazon aws-marketplace --query 'Images[*].[ImageId]' --region us-east-2  --output table
	
	ami-0ee4f2271a4df2d7d  == AMAZON3
	
	ami-05fb0b8c1424f266b  == Ubuntu
	
	
## Create EC2 Instance:
	
	aws ec2 run-instances --image-id ami-xxxxxxxx --count 1 --instance-type t2.micro --key-name OHIO --security-group-ids sg-003317f51d2d1bc13 --subnet-id subnet-084ef57375a51e5c6
	
	aws ec2 run-instances --image-id ami-05fb0b8c1424f266b --count 1 --instance-type t2.micro --key-name OHIO --security-group-ids sg-003317f51d2d1bc13 --subnet-id subnet-084ef57375a51e5c6  --output table
	
## List of Running Instance:

	aws ec2 describe-instances --output table

	
## Tag your Instance:
 
	aws ec2 create-tags --resources i-00a94508a96a3c8ec  --tags Key=Name,Value=MyInstance

## Restart, STOP, Start EC2 Instance:

	aws ec2 reboot-instances --instance-ids i-0f6eaa4fdb0f6dd52
	
	aws ec2 stop-instances --instance-ids i-0f6eaa4fdb0f6dd52
	
	aws ec2 start-instances --instance-ids i-0f6eaa4fdb0f6dd52
	
	aws ec2 terminate-instances --instance-ids i-0f6eaa4fdb0f6dd52


## Create Volume:


	aws ec2 create-volume --volume-type gp2 --size 20 --availability-zone us-east-1a --iops 1000 --encrypted --tag-specifications 'ResourceType=volume,Tags=[{Key=purpose,Value=production},{Key=cost-center,Value=cc123}]'



## Create VPC

## List of Existing VPC:
	
	aws ec2 describe-vpcs
	aws ec2 describe-vpcs --output table
		
## Create VPC
	
	aws ec2 create-vpc help
	aws ec2 create-vpc --cidr-block 10.0.0.0/16
		
## Add Tag to VPC
	
	aws ec2 create-tags --resources vpc-0772632f4e8a63d90 --tags Key=Name,Value=DevOps-VPC
			
## Create Public-Subnet 
	
	aws ec2 describe-subnets
	
	aws ec2 describe-subnets --output table
	
	aws ec2 create-subnet help
	
	aws ec2 create-subnet --vpc-id vpc-a01106c2 --cidr-block 10.0.1.0/24 --availability-zone  ap-northeast-3a --dry-run | --no-dry-run
	
	aws ec2 create-tags --resources  subnet-01fa42eeb14c6b9a4 --tags Key=Name,Value=Public-Subnet
	
	aws ec2 modify-subnet-attribute --subnet-id subnet-1a2b3c4d --map-public-ip-on-launch
		
## Create Private-Subnet
	
	aws ec2 create-subnet --vpc-id vpc-010cd00462f4cb8de --cidr-block 10.0.2.0/24
	
	aws ec2 create-tags --resources  subnet-0a41ce7803a4bf24a --tags Key=Name,Value=Private-Subnet
		
## List Route Table
	
	aws ec2 describe-route-tables
	
	aws ec2 describe-route-tables --filters "Name=vpc-id,Values=vpc-010cd00462f4cb8de" --query "RouteTables[]"
		
## Create Route Table
		
	aws ec2 create-route-table --vpc-id vpc-010cd00462f4cb8de
	
	aws ec2 create-tags --resources rtb-07cad0f75ad5b2ccb --tags Key=Name,Value=DevOps-RT
		
## Associate RT with Subnet
	
	aws ec2 associate-route-table --route-table-id rtb-0e7c84380d718cb5d --subnet-id subnet-0a41ce7803a4bf24a
	
	aws ec2 associate-route-table --route-table-id rtb-0e7c84380d718cb5d --subnet-id subnet-0a41ce7803a4bf24a

## Create IGW
		
	aws ec2 describe-internet-gateways
	
	aws ec2 create-internet-gateway
	
	aws ec2 create-tags --resources igw-0475124d9500cda94 --tags Key=Name,Value=DevOps-IGW
	
	aws storagegateway list-gateways
		
	
## Attach/Detach IGW to VPC
	
	aws ec2 attach-internet-gateway --internet-gateway-id igw-0475124d9500cda94 --vpc-id vpc-010cd00462f4cb8de
	
	aws ec2 detach-internet-gateway --internet-gateway-id=igw-37e81153 --vpc-id=vpc-e2087c86
		
## Add IGW entry in Public-RT
	
	aws ec2 create-route --route-table-id rtb-0823c0c8edd4db3fa --destination-cidr-block 0.0.0.0/0 --gateway-id igw-0475124d9500cda94

## Create SecurityGroup:
	
	aws ec2 create-security-group --group-name DevOps-SG --description "DevOps-SG" --vpc-id vpc-0772632f4e8a63d90
	
	aws ec2 create-tags --resources sg-059ea8ae4963f8316 --tags Key=Name,Value=DevOps-SG
	
	aws ec2 authorize-security-group-ingress --group-id sg-059ea8ae4963f8316 --protocol tcp --port 22 --cidr 0.0.0.0/0
	
## Create VPC Peering:

	aws ec2 describe-vpcs --output table
	
	aws ec2 create-vpc-peering-connection --vpc-id vpc-080d0dc4cb57e680f  --peer-vpc-id vpc-02215786b52e8ebad
	
	aws ec2 describe-vpc-peering-connections
	
	aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-00566bf92d7d55782
	
	aws ec2 create-route --route-table-id rtb-0e6e4300480cccd00 --destination-cidr-block 10.0.0.0/16 --gateway-id pcx-00566bf92d7d55782
	
	aws ec2 create-route --route-table-id rtb-095c6a32fe61b5f48 --destination-cidr-block 172.31.0.0/16 --gateway-id pcx-00566bf92d7d55782
	
	aws ec2 delete-vpc-peering-connection --vpc-peering-connection-id pcx-00566bf92d7d55782
	
	aws ec2 delete-vpc-peering-connection --vpc-peering-connection-id pcx-00566bf92d7d55782

## Create EndPoint:


	aws ec2 create-vpc-endpoint --vpc-id vpc-1a2b3c4d --service-name com.amazonaws.us-east-2.s3 --route-table-ids rtb-11aa22bb
	
	


## Clean up VPC

### Delete your security group:
	
	aws ec2 delete-security-group --group-id sg-e1fb8c9a
		
### Delete your subnets:
	
	aws ec2 delete-subnet --subnet-id subnet-b46032ec
	
	aws ec2 delete-subnet --subnet-id subnet-a46032fc
		
### Delete your custom route table:
	
	aws ec2 delete-route-table --route-table-id rtb-c1c8faa6
		
### Detach your internet gateway from your VPC:
	
	aws ec2 detach-internet-gateway --internet-gateway-id igw-1ff7a07b --vpc-id vpc-2f09a348
	
### Delete your internet gateway:
	
	aws ec2 delete-internet-gateway --internet-gateway-id igw-1ff7a07b
		
### Delete your VPC:
		
	aws ec2 delete-vpc --vpc-id vpc-2f09a348
		

## Create SG for VPC

	aws ec2 create-security-group --group-name DevOps-SG --description "DevOps-SG" --vpc-id vpc-010cd00462f4cb8de
	
	aws ec2 create-tags --resources sg-087785f4f91e28a79 --tags Key=Name,Value=DevOps-SG
		
## Create Key-pair

	aws ec2 create-key-pair --key-name DevOps.pem --query 'DevOps.pem' --output text > DevOps.pem
		


## S3


## S3 Help:

	aws s3 help
	
## List S3 Bucket:

	aws s3 ls
		
## Create S3 Bucket:

	aws s3 mb s3://devopshangoutbucket1002

		
Delete S3 Bucket:

	aws s3 rb s3://devopshangout-bucket-101
	
	aws s3 rb s3://devopshangout-bucket-101 --force
		
## Remove Object in Bucket:

	aws s3 ls s3://devopshangoutbucket1001/
	
	aws s3 rm s3://devopshangoutbucket1001/3.png

## Copy Files inside Bucket:


	aws s3 cp file1.txt s3://devopshangoutbucket1001/

## Move File inside Bucket:


	aws s3 mv s3://devopshangoutbucket1001/file1 s3://devopshangoutbucket1001/file2
	
	aws s3 ls s3://devopshangoutbucket1001/

## Presign URL:

	aws s3 presign s3://devopshangoutbucket1001/file2
		
## Copy Files from one Bucket to Another:


	aws s3 sync s3://devopshangoutbucket1001/ s3://devopshangoutbucket1002/
	
	


## RDS

## Create RDS
		
	aws rds create-db-instance --engine postgres --db-instance-identifier devops-posgresql-101 --allocated-storage 20 --db-instance-class db.t3.micro --master-username postgresqladmin --master-user-password admin12345678 --backup-retention-period 0 --storage-type standard --port 5432 --publicly-accessible

	aws rds describe-db-instances --db-instance-identifier devopshangout-mysql-101

## Stop,Start,Reboot RDS:


	aws rds stop-db-instance --db-instance-identifier devopshangout-mysql-101
	
	aws rds start-db-instance --db-instance-identifier devopshangout-mysql-101
	
	aws rds reboot-db-instance --db-instance-identifier devopshangout-mysql-101

## Delete RDS

	aws rds delete-db-instance --db-instance-identifier devopshangout-mysql-101 --skip-final-snapshot

	mysql
	postgres
	sqlserver-se
	sqlserver-ex
	sqlserver-web

## IAM


## List of IAM Users:

	
	aws iam list-users
	aws iam list-users --output table
	
## List of IAM Group:


	aws iam list-groups
	aws iam list-groups --output table

## Create IAM Create:


	aws iam create-user --user-name devops-cli-101
	aws iam create-user --user-name devops-cli-101 --output table

## Create Access Key for IAM User:


	aws iam create-access-key --user-name devops-cli-101
	aws iam create-access-key --user-name devops-cli-101 --output table
	
## List of Access key user:


	aws iam list-access-keys --user-name devops-cli-101 --output table
	
	
## List of User Policies:


	aws iam list-user-policies --user-name devops-cli-101 --output table
	
## Delete user:


	aws iam delete-user --user-name devops-cli-101
	aws iam delete-user --user-name devops-cli-101 --output table
	
## Delete access key for user:


	aws iam list-access-keys --user-name devops-cli-101 | jq -r .AccessKeyMetadata[ ].AccessKeyId
	aws iam delete-access-key --user-name  devops-cli-101 --access-key-id (accessKeyID)
	aws iam delete-access-key --user-name  devops-cli-101 --access-key-id AKIARPERIRPYFH3J7ME6
	

## Activate/deactivate access key for user:


	aws iam update-access-key --status Active --user-name (username) --access-key-id (access key)
	aws iam update-access-key --status Inactive --user-name (username) --access-key-id (access key)
	
	
## Generate new access key for user:

	aws iam create-access-key --user-name devops-cli-101 | jq -r '.AccessKey | .AccessKeyId+” “+.SecretAccessKey'

## List of Policies:


	aws iam list-policies --max-items 10 --output table 
	aws iam list-policies --query 'Policies[?PolicyName==`ReadOnlyAccess`]'
	aws iam list-policies --query 'Policies[?PolicyName==`AdministratorAccess`]'
	aws iam list-policies --query 'Policies[?PolicyName==`EC2FullAccess`]'
	


## ElastiCache:

	
	aws elasticache create-cache-cluster --cache-cluster-id "cluster-test" --engine redis --cache-node-type cache.t2.micro --num-cache-nodes 1
	aws elasticache create-cache-cluster --cache-cluster-id "cluster-test" --engine memcached --cache-node-type cache.t2.micro --num-cache-nodes 1
	
	aws elasticache describe-cache-clusters --output table
	aws elasticache delete-cache-cluster --cache-cluster-id cache-sf4545777
	aws elasticache reboot-cache-cluster --cache-cluster-id cache-sf4545777
	



## EFS:

	aws efs create-file-system --performance-mode generalPurpose --throughput-mode bursting --encrypted --tags Key=Name,Value=my-file-system --output table
	
	aws efs describe-file-systems --output table
	
	aws efs describe-file-systems --file-system-id fs-c7a0456e --output table


