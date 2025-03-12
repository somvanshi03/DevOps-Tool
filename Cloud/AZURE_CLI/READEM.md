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

	List all VMs
	List all VMs by resource group
	List all VMs by resource group with details
	az vm list-sizes --location "eastus" -o table
	az vm create -g DevOps-RG -l eastus  -n myvm1 --image win2016datacenter --size Standard_B1ms --admin-username mridul --admin-password Admin@123456 --public-ip-sku Standard
	az vm create -g DevOps-RG -l eastus  --nsg DevOps-NSG  -n myvm101 --image win2016datacenter --size Standard_B1ms --admin-username mridul --admin-password Admin@12345678 --public-ip-sku Standard
	az vm deallocate -g DevOps-RG -n myvm1
	az vm delete -g DevOps-RG -n myvm1 --yes

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