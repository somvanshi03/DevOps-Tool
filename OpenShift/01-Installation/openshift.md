# Day - 1 - OpenShift 

## OpenShift Playground

	https://www.redhat.com/en/interactive-labs/red-hat-openshift-4.17-playground
	
## Create Project in OpenShift:

	oc new-project project101
	
## Verify the project:

	oc project project101
	
## List of all projects:

	oc get projects

## Delete Project:

	oc delete project project101
	
	
## Create POD

### Step 1: Log in to OpenShift

	oc login https://your-openshift-cluster-api:6443

### Step 2: Create a New Project (Optional)

	oc new-project project101
	
	
### Step 3: Create a Pod 

	oc create -f https://k8s.io/examples/pods/simple-pod.yaml
	
### Step 4: Verify the Pod

	oc get pods

# Day - 2 - OpenShift 


## Create Deployment


### Step 1: Log in to OpenShift

	oc login https://your-openshift-cluster-api:6443

### Step 2: Create a New Project (Optional)

	oc new-project my-project
	

### Step 3: Create the Deployment

	oc create -f https://k8s.io/examples/controllers/nginx-deployment.yaml
	
### Step 4: Verify the Deployment

	oc get deployments
	oc get pods

### Step 5: Expose the Deployment (Optional)

	oc expose deployment nginx-deployment --port=80 --target-port=80
	oc expose svc nginx-deployment

 # Day - 3 - OpenShift Troubleshooting
 
 ## Check Node status
	
	oc get nodes 
	oc get nodes -o wide
	
	Please Install Matrics 
	
	oc adm top node 
	oc adm top pod 
	
	
# Day 4: PV and PVC

## Create NFS Volume

## Create PV 

	oc explain persistentvolume
	
	