# AZURE CLI

## Azure Login
	
	az login --tenant <tenant-ID>
	az login
	az account set --subscription "Your-Subscription-Name-Or-ID"


## Azure Location List
	
	az account list-locations -o table

## Resource Group:
	az -h
	az group -h
	az group list
	az group create -h
	az group create -l eastus -n DevOps-RG
	az group create -l eastus -n DevOps-RG --tags "ENV=DevOps"
	az group list -o table
	az group delete -n DevOps-RG -y

## Network:
	az network -h
	az network vnet -h
	az network vnet create -h
	az network vnet create -g DevOps-RG -n DevOps-vNet --address-prefix 192.168.0.0/16 --subnet-name VM-Subnet --subnet-prefix 192.168.0.0/24
	az network vnet list -o table
	az network vnet delete -g DevOps-RG -n DevOps-vNet
	az network vnet create -g DevOps-RG -n DevOps-vNet --address-prefix 10.0.0.0/24 --subnet-name VM-Subnet --subnet-prefix 10.0.0.0/24

## NSG:
	az network nsg -h
	az network nsg  create -h
	az network nsg create -g DevOps-RG -n DevOps-NSG
	az network nsg rule create -g DevOps-RG --nsg DevOps-NSG -n RDP-Port --priority 100 --source-address-prefixes 122.177.252.111 --source-port-ranges '*' --destination-address-prefixes '3389' --destination-port-ranges 3389
	az network nsg delete -h
	az network nsg delete -g DevOps-RG -n DevOps-NSG
	Attach NSG with Subnet:
	az network vnet subnet update -g DevOps-RG -n VM-Subnet --vnet-name DevOps-vNet --network-security-group DevOps-NSG

## Virtual Machine:

### Image List:

	az vm list
	
	az vm list-sizes --location
	
	az vm list-skus -l westus
	
	az vm list-sizes --location "eastus" -o table
	
	az vm create -g DevOps-RG -l eastus  -n myvm1 --image win2016datacenter --size Standard_B1ms --admin-username mridul --admin-password Admin@123456 --public-ip-sku Standard
	
	az vm create -g DevOps-RG -l eastus  --nsg DevOps-NSG  -n myvm101 --image win2016datacenter --size Standard_B1ms --admin-username mridul --admin-password Admin@12345678 --public-ip-sku Standard
	
	az vm deallocate -g DevOps-RG -n myvm1
	
	az vm delete -g DevOps-RG -n myvm1 --yes

## Redeploy VM:

	az vm redeploy -g DevOps-RG --name myvm101
	
## Reapply VM:

	az vm reapply -g DevOps-RG -n myvm101

## Delete VM:

	az vm delete -g DevOps-RG -n myvm101 --yes

## Deallocate:

	az vm deallocate -g DevOps-RG -n 

## Reimage a virtual machine:

	az vm reimage -n myvm101 -g DevOps-RG --admin-password MyPassword --custom-data "dGVzdA==" --temp-disk false --exact-version 0.1
	
## Resize VM:

	az vm resize -g DevOps-RG -n myvm101 --size Standard_DS3_v2
	
## Resize all VMs in a resource group:

		
	az vm resize --size Standard_DS3_v2 --ids $(az vm list -g DevOps-RG --query "[].id" -o tsv)
	
## Restart VMs

	az vm restart -g DevOps-RG -n myvm101
	
## Restart all VMs in a resource group:

	az vm restart --ids $(az vm list -g DevOps-RG --query "[].id" -o tsv)

## Start a stopped VM:

	az vm start -g DevOps-RG -n myvm101
	
## Start all VMs in a resource group:


	az vm start --ids $(az vm list -g DevOps-RG --query "[].id" -o tsv)
	

## Power off (stop) a running VM:

	az vm stop -g DevOps-RG -n myvm101

## Show information about a VM:

	az vm show -g DevOps-RG -n myvm101 -d

## Add or update a tag:

	az vm update -n myvm101 -g DevOps-RG --set tags.tagName=tagValue
	
## Remove a tag:

	az vm update -n myvm101 -g DevOps-RG --remove tags.tagName
	
## Get the details for all VMs in a resource group:

	az vm show -d --ids $(az vm list -g DevOps-RG --query "[].id" -o tsv)
	
## Storage:

	az storage -h
	az storage account create -h
	az storage account create -n  devopsstoragenettech01 -g DevOps-RG -l eastus --sku Standard_LRS

## Azure Container:

	az group create -l eastus -n DevOps-RG --tags "ENV=DevOps"
	az container create -h
	az container create --name nginx --image library/nginx -g DevOps-RG --ip-address public
	az container list -o table
	az container attach --name nginx2 --resource-group DevOps-RG
	az container show --name nginx2 -g DevOps-RG -o table
	az container delete --name nginx2  -g DevOps-RG --yes
	az container create --name hellowindows --image mcr.microsoft.com/windows/servercore/iis -g DevOps-RG --ip-address public --os-type  Windows  --cpu 2 --memory 3.5

## AKS:

	az group create --name DevOps-RG --location eastus
	az aks create --resource-group DevOps-RG --name myAKSCluster --node-count 2 --node-vm-size Standard_B2S --enable-addons monitoring --generate-ssh-keys
	az aks show --resource-group DevOps-RG --name myAKSCluster
	kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=kubernetes-dashboard:dashboard-admin-sa
	az aks get-credentials --resource-group myResourceGroup --name myAKSCluster