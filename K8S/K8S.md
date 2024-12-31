# K8S Commands

## Check Kubernetes Version:


	> kubectl version


## Check Node List and version:


	> kubectl get nodes
	> kubectl get nodes -o wide
	> kubectl cluster-info
    > kubectl api-versions


	> kubectl describe node <nodeIP _ or name>
	
## Configuration file location:

	> cd /etc/kubernetes/
	> cd /etc/kubernetes/manifests/


## Check Pods:


	> kubectl get pods
	> kubectl get pods -o wide
	> kubectl get pods --all-namespaces
	> kubectl get pods --all-namespaces -o wide


## Kubernetes YAML Basics:

	> kubectl explain pods	 --recursive	| more
	> kubectl explain deployment
	> kubectl explain deployment --recursive

		apiVersions: [ v1 | apps/v1 ]
		Kind: [ Pod | Deployment | Service | PersistentVolume ]
		metadata:
			name: <Value>
			label: <Value>
		spec:
			containers:
				name: <Value>
				image: <Value>
				command: <Value>
				workingDir: <Value>
				ports: <Value>
				env: <Value>
				resources: <Value>
				volumeMounts: <Value>
				livenessProbe: <Value>
				readinessProbe: <Value>
		restartPolicy: Never	# Defaults to Always.
		
		
------------------------------------------------------
https://kubernetes.io/docs/concepts/workloads/pods/ 
https://kubernetes.io/docs/reference/kubectl/cheatsheet/
https://www.bluematador.com/learn/kubectl-cheatsheet
https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#create


### Create Pod:

		apiVersion: v1
		kind: Pod
		metadata:
		  name: nginx-test
		spec:
		  containers:
		  - name: nginx-test
			image: nginx:1.14.2
			ports:
			- containerPort: 80
	

	> kubectl create -f pod1.yaml	# for the first time.
	> kubectl apply -f pod1.yaml	# during updating pods
	> kubectl explain pods	 --recursive	| more
	> kubectl explain deployment
	> kubectl explain deployment --recursive
	> kubectl run nginx-prod --labels="app=prod" --image=nginx:1.7.1

	
### Get Pods Details:


	> kubectl get pods
	> kubectl get pods -o wide
	> kubectl get nodes -o yaml
	> kubectl get pods --all-namespaces
	> kubectl describe pods nginx-test
	> kubectl exec -it nginx-test /bin/bash

### Get Pod logs :

	> kubectl logs nginx-test
	> kubectl logs -f nginx-test -c <continer_name>

	
### Delete Pods:


	> kubectl delete pods nginx-test
	> kubectl get pods
	


### kubectl api-resources



## Labels & Selector:


Labels are the mechanism you use to organise kubernetes objects.
This is key value pair. This is similer to Tags in aws.

labels:
	env: Development
	app: Dotnet



apiVersion: v1
kind: Pod
metadata:
  name: nginx-test
  labels:
	 env: Development
	 app: Dotnet
spec:
  containers:
  - name: nginx-test
    image: nginx:1.14.2
    ports:
    - containerPort: 80
	
-------------------------
	> kubectl create -f pod2.yaml 
	
	> kubectl get pods
	> kubectl get pods -o wide
	> kubectl get nodes -o yaml
	> kubectl get pods --show-labels

apply labels:
------------
	> kubectl label pods nginx-test env=QA

List pods according to labels:
------------------------------

	> kubectl get pods -l env=developyment
	> kubectl get pods -l env!=developyment
	
	> kubectl delete  pods -l env!=developyment
	
	> kubectl get pods -l 'env in (developyment, testing)'
	> kubectl get pods -l 'env notin (developyment, testing)'
	
	> kubectl get pods -l class-pods,myname=mridul
	
=====================================

### Node Selectors:
----------------
https://kubernetes.io/docs/tasks/configure-pod-container/assign-pods-nodes/

One user case for selecting labels is to constrain the set of nodes which a pod can schedule. 
you can tell a pod to only be able to runon particular nodes.

apiVersion: v1
kind: Pod
metadata:
  name: nginx-test
  labels:
	 env: Development
	 app: Dotnet
spec:
  containers:
  - name: nginx-test
    image: nginx:1.14.2
    ports:
    - containerPort: 80
  nodeSelector:
	hardware: t2-medium
	disktype: ssd
	
	> kubectl create -f pod.yaml
	> kubectl get pods
	> kubectl get nodes
	> kubectl label nodes <NodeName> hardware=t2-medium
	> kubectl describe pods <pod Name>
	
	> kubectl get nodes --show-labels
	> kubectl label nodes k-w disktype=ssd
	> kubectl label nodes k-w hardware=t2-medium
	> kubectl get nodes --show-labels
	> kubectl describe nodes k-w

apiVersion: v1
kind: Pod
metadata:
  name: nginx-test
  labels:
	 env: Development
	 app: Dotnet
spec:
  containers:
  - name: nginx-test
    image: nginx:1.14.2
    ports:
    - containerPort: 80
  nodeSelector:
	hardware: t2-medium
	disktype: ssd	
	hostname: k-w
	
-------------------------------------------------------------------
https://blog.kubecost.com/blog/kubernetes-node-affinity/

NodeAffinity and Pod Affinity

	> There are two types of affinity: Kubernetes node affinity and Kubernetes pod affinity.
	> Node affinity attracts pods to nodes, and pod affinity attracts pods to pods.
	> Kubernetes node affinity is a feature that enables administrators to match pods according to the labels on nodes
	> 








	
=====================================
Scaling and Replication:
------------------------

Kubernetes was designed to orchestrate multiple container and replication.

apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.1
        ports:
        - containerPort: 80

	> kubectl create -f myrc.yml
	> kubectl get rc
	> kubectl describe rc myrc
	> kubectl get all
	> kubectl get pods
	> kubectl scale --replicas=4 rc -l app=nginx
======================================	
	
ReplicaSet:
-----------

Next generation of ReplicaController
The replication contoller only supports equality-based selector whereas the replica set supports set-based selector.

kubectl run nginx-prod --labels="app=prod" --image=nginx:1.7.1
kubectl run nginx-uat --labels="app=uat" --image=nginx:1.7.1
kubectl run nginx-dev --labels="app=dev" --image=nginx:1.7.1

---
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: nginx
spec:
  replicas: 6
  selector:
    matchExpressions:
      - key: app
        operator: In
        values:
          - dev
          - uat
          - qa
          - prod
  template:
    metadata:
      name: nginx
      labels:
        app: dev
    spec:
      containers:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80

	> kubectl create -f rs.yml
	> kubectl get all
	> kubectl delete rs --cascade=false nginx
	
===========================================

Deployment:
-------------

A Deployment object acts as a supervisor for pods, giving you fine-grained control over how and when a new pod is rolled out, updated or rolled back to a previous state.

vi deploy.yml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: DevOpsHangout
  labels:
    app: dev
spec:
  replicas: 5
  selector:
    matchLabels:
      app: dev
  template:
    metadata:
      labels:
        app: dev
    spec:
      containers:
      - name: DevOpsHangout
        image: nginx:1.7.9
        ports:
        - containerPort: 80

	> kubectl create -f deploy.yml
	> kubectl get all
	> kubectl get deploy
	> kubectl get rs
	> kubectl rollout status deployment devopshangout
	> kubectl rollout history  deployment devopshangout
	> kubectl rollout history  deployment devopshangout --revision=1
	> kubectl rollout undo  deployment devopshangout --to-revision=2
	> kubectl rollout undo  deployment devopshangout --to-revision=3
	> kubectl autoscale deployment devopshangout --min=5 --max=15 --cpu-percent=80



===========================================================

https://www.ibm.com/docs/en/cloud-private/3.2.0?topic=networking-kubernetes-service-types

Services:
---------

ClusterIP:
----------
	
	> Expose VIP only reachable from within the cluster.
	> Mainly used to communicate between components of microservices.
	
---
kind: Service
apiVersion: v1
metadata:
  name: devopshangout
spec:
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: dev
  type: ClusterIP

  
kubectl create -f ClusterIP.yml
kubectl get svc

=============================

NodePort:
----------

Makes a service accessble from outside the cluster.
Expose the service on the same port of each selected node in the cluster using NAT.


---
kind: Service
apiVersion: v1
metadata:
  name: devopshangout
spec:
  ports:
    - port: 80
      targetPort: 30432
  selector:
    app: dev
  type: NodePort
----------------------------------

kubectl expose deployment nginx-deployment --port=8765 --target-port=9376  --name=nginx-deployment --type=LoadBalancer

================================================


Volumes:
----------

Containers are ephemeral (Short Lived in nature).
All data stored inside a container is deleted if the container crashes, However the kubelet will restart it with a clean state. which means that it will bot have any of the old data.
To overcome this problem, Kubernetes uses Volumes. A volume is essentially a directory backed by a storage medium. The storage medium and its content are determined by the volume type.
In Kubernetes, a volume is attached to a POD and shared among the continers of that POD.
The Volume has the same life span as the POD, and it outlives the container of the pod- this allows data to be preserved accross container restart.


Types of Volume:
------------------

A volume type decides the properties of the directory. like size. content. etc. some examples of Volume types are:
	
	> node-local types such as emptyDir and hostpath.
	> file-sharing types such as nfs.
	> cloud provider-specific types like. awsElasticBlockStore. AzureDisk. or gcePersistentDisk.
	> distributed file system types, for example glusterfs or cephfs.
	> special-purpose types like. secret, gitRepo.
	> persistentVolumeClaim.
	

emptyDir:
----------
https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/
https://www.kubermatic.com/blog/keeping-the-state-of-apps-1-introduction-to-volume-and-volumemounts/
https://newrelic.com/blog/how-to-relic/how-to-use-kubernetes-volumes

apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis
    volumeMounts:
    - name: redis-storage
      mountPath: /data/redis
  volumes:
  - name: redis-storage
    emptyDir: {}


-------------------------------------------------------


HostPath:
----------

	> Use this when we want to access the content of a pod/container from hostmachine.
	> A Hostpath volume mounts a file or directory from the host node's filesystem into your pod.
	
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    hostPath:
      # directory location on host
      path: /data
	  
	kubectl exec - test-container -- cat /test-pd
	kubectl exec - test-container -it -- /bin/bash 
	cd /test-pd
	ls
-----------------------------------------------------------

PersistentVolumes:
--------------------
https://kubernetes.io/docs/concepts/storage/persistent-volumes/
https://medium.com/avmconsulting-blog/persistent-volumes-pv-and-claims-pvc-in-kubernetes-bd76923a61f6

	> Create EBS in AWS Account manually.
	> Create Volume where our K8S Cluster is present.
	> 
vi mypv.yml

---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: myebsvol
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Recycle
  awsElasticBlockStore:
    volumeID: vol-09cfaa130000cb91b
    fsType: ext4



vi mypvc.yml

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myebsvolclaim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi



			

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pvdeploy
spec:
  replicas: 5
  selector:
    matchLabels:
      app: mypv
  template:
    metadata:
      labels:
        app: mypv
    spec:
      containers:
        - name: DevOpsHangout
          image: nginx:1.7.9
          ports:
            - containerPort: 80
          volumeMounts:
            - name: mypd
              mountPath: /tmp/persistent
          volumes:
            - name: mypd
              persistentVolumeClaim: null
              claimName: myebsvolclaim

			
===================================

Health Check:
--------------
https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/
https://newrelic.com/blog/how-to-relic/kubernetes-health-checks
https://blog.knoldus.com/how-to-do-health-check-in-kubernetes/

apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-exec
spec:
  containers:
  - name: liveness
    image: registry.k8s.io/busybox
    args:
    - /bin/sh
    - -c
    - touch /tmp/healthy; sleep 30; rm -f /tmp/healthy; sleep 600
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5

======================================

Secrets and MapConfig:
-----------------------------

Create MapConfig:
	
	> Using  command
	> Using files
	
ConfigMap can be accessed in following ways.
	
	> as env variables
	> as volume in the pod
	
vi sample.conf

YEA, You have to belive this is config file


Create ConfigMap from files

	> kubectl create configmap <mapname> --from-file=<file_to_read>
	> kubectl create configmap mymap --from-file=sample.conf 
	> kubectl describe configmaps/<mapname>
	> kubectl get configmap <mapname> -o yaml
	> kubectl get configmap
	> kubectl get configmap mymap -o yaml
	> kubectl describe configmap mymap
	
	Written content will be visible in mapconfig. but not in secret.
	
---
apiVersion: v1
kind: Pod
metadata:
  name: myvolconfig
spec:
  containers:
  - image: nginx:1.7.9
    name: test-container
    volumeMounts:
     - mountPath: "/tmp/config"
       name: testconfigmap
  volumes:
  - name: testconfigmap
    configMap:
     name: mymap
     items:
     - key: sample.conf
       path: sample.conf
      
	> kubectl create -f deploymapconfig.yml 
	> kubectl get pods
	> kubectl exec pod_name -it -- /bin/bash
	> cd /tmp/config
	> cat sample.conf 
	
	and you will see the content of sample.conf file.
	
--------------------------------------------------------------

Now read that file as env variables:
------------------------------------------

---
apiVersion: v1
kind: Pod
metadata:
  name: myvolconfig
spec:
  containers:
  - image: nginx:1.7.9
    name: test-container
	env:
	- name: MYENV
	   valueFrom: 
	     configMapKeyRef:
		   name: mymap				# name of your config created
		   key: sample.conf
		   

=============================================

	> kubectl create secret --help
	> kubectl create secret generic  --help
    >  echo "root" > username.txt, echo "passowrd" > password.txt
	> kubectl create secret generic mysecret --from-file=username.txt --from-file=password.txt
	> kubectl describe secret/<secret_name>
	> 


---
apiVersion: v1
kind: Pod
metadata:
  name: myvolconfig
spec:
  containers:
  - image: nginx:1.7.9
    name: test-container
    volumeMounts:
     - mountPath: "/tmp/secrets"
       name: testconfigmap
  volumes:
  - name: testsecrets
	secret:
      secretName: mysecret
	  
===================================

NameSpace:
---------------

Get NameSpace details.
	
	> kubectl explain ns --recursive |more 
	> kubectl get ns
	> kubectl create ns dev-team
	> kubectl create ns uat-team
	> kubectl create ns prod-team
	> kubectl get ns
	
Create PODs in dev uat and prod namespace

	> kubectl -n dev-team  run nginx-dev --labels="app=dev" --image=nginx:1.7.1
	> kubectl -n uat-team  run nginx-uat --labels="app=uat" --image=nginx:1.7.1
	> kubectl -n prod-team  run nginx-prod --labels="app=prod" --image=nginx:1.7.1
	> kubectl get pods -o wide
	> kubectl get pods -n dev-team  -o wide
	> kubectl get pods -n uat-team  -o wide
	> kubectl get pods -n prod-team  -o wide
	> kubectl get pods --all-namespaces

Describe PODs

	> kubectl describe pods nginx-dev -n dev-team
	> kubectl describe pods nginx-uat -n uat-team
	> kubectl describe pods nginx-prod -n prod-team
	
https://kubernetes.io/docs/tasks/administer-cluster/manage-resources/quota-memory-cpu-namespace/#:~:text=Create%20a%20ResourceQuota&text=The%20memory%20request%20total%20for,must%20not%20exceed%201%20cpu.	



Save the namespace for the subsequent kubectl commands in the context:

	> kubectl config set-context $(kubectl config current-context) --namespace=<insert-namespace-name-here>
	> kubectl config set-context $(kubectl config current-context) --namespace=dev
	> kubectl config set-context my-context --namespace=mystuff
	> kubectl config set-context --current --namespace=my-namespace
	
	> kubectl get ns
	> kubectl get pods -n dev-team
	> kubectl config set-context $(kubectl config current-context) --namespace=dev-team
	> kubectl get pods

	> kubectl config view |grep namespace
	

===============================

Resource Quotas:
---------------------

apiVersion: v1
kind: ResourceQuota
metadata:
  name: mem-cpu-demo
spec:
  hard:
    requests.cpu: "1"
    requests.memory: 1Gi
    limits.cpu: "2"
    limits.memory: 2Gi

	> kubectl create -f resourceQuota.yaml


apiVersion: v1
kind: Pod
metadata:
  name: quota-mem-cpu-demo
spec:
  containers:
  - name: quota-mem-cpu-demo-ctr
    image: nginx
    resources:
      limits:
        memory: "800Mi"
        cpu: "800m"
      requests:
        memory: "600Mi"
        cpu: "400m"
		
		> kubectl create -f pod-qouta.yml
		> kubectl describe pods quota-mem-cpu-demo
		
============================================


Horizontal Pod Autoscaler:
---------------------------------

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml 
https://github.com/kubernetes-sigs/metrics-server

	> wget -O metrics-server.yaml  https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml 
	> add below lines in deployment objects.
	 --cert dir=/tmp
	 --secure-port=4443
	 --kubectl-insecure-tls 
	 
==================================

DaemonSet:
---------------

A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

kubectl label nodes <Node_name> server=group1












================================

StatefullSets:
----------------

	> Statefull applications store data about the state from client requests on the server itself and user that state to process further requests.
	> Examples of statefull applications including MongoDB, Cassendra and mysql.
	
	> Stateless app is an application program that does not save client data generated in one session for use in the next session with the client.
	> Examples of stateless applications include major websites (Amazon, Google, Faceboo, twitter), whatsapp, aws s3 and EBS.
	
	
===========================

MultiMaster Cluster:
-------------------------
https://github.com/Devopshangout/kubernetes/tree/master/kubeadm-ha-multi-master

LB: 	1 GB RAM 1 Core CPU
M1:  4 GB RAM 2 Core CPU
M2:  4 GB RAM 2 Core CPU
W1:  4 GB RAM 2 Core CPU
W2:  4 GB RAM 2 Core CPU

Login to LB machine:

	> apt update && apt install -y haproxy
	> Configure haproxy
		frontend kubernetes-frontend
		bind 172.16.16.100:6443
		mode tcp
		option tcplog
		default_backend kubernetes-backend

	backend kubernetes-backend
		mode tcp
		option tcp-check
		balance roundrobin
		server kmaster1 172.16.16.101:6443 check fall 3 rise 2
		server kmaster2 172.16.16.102:6443 check fall 3 rise 2


===============================================

Cluster Upgrade:
---------------------

https://platform9.com/blog/kubernetes-upgrade-the-definitive-guide-to-do-it-yourself/
https://devopscube.com/upgrade-kubernetes-cluster-kubeadm/


1. We dont need to upgrade all cluster at a time.
2. We need to upgrade from master first.
3. We need to upgrade cluster one by one.
4. We need to take a backup of Database and configuration.
	/etc/kubernetes/tmp:
			kubeadm-backup-etcd-<date>-<time>
			kubeadm-backup-manifests-<date>-<time>
			
			
5. Kubernetes also takes backup of etcd and configuration in /tmp dir.
6. Containers will restart after upgrade on master node. like scheduler, API server. etc.
7. If you are upgrading cluster then pod networ will not be upgraded autometically. you need to upgrade it mannually.
8. Certificate also will be upgraded.
9. 
	
	Kubernetes Cluster upgrade tools.
	
		> Ansible.
		> Terraform.
		> Shell / Python Script.
		> 
Upgrade for centos:
-------------------------
https://v1-22.docs.kubernetes.io/docs/tasks/administer-cluster/kubeadm/kubeadm-upgrade/ 

	> Find the latest patch release for Kubernetes 1.22 using the OS package manager:
	# find the latest 1.22 version in the list
	# it should look like 1.22.x-0, where x is the latest patch
			> yum list --showduplicates kubeadm --disableexcludes=kubernetes
	
	> Upgrading control plane nodes 
	> Call "kubeadm upgrade" 
	# replace x in 1.22.x-0 with the latest patch version
			> yum install -y kubeadm-1.22.x-0 --disableexcludes=kubernetes
	
	> Verify that the download works and has the expected version:
			> kubeadm version
			> kubectl version
			> kubelet version
	
	> Verify the upgrade plan:
			> kubeadm upgrade plan
	> This command checks that your cluster can be upgraded, and fetches the versions you can upgrade to. It also shows a table with the component config version states.
	
	> Choose a version to upgrade to, and run the appropriate command. For example:
			> sudo kubeadm upgrade apply v1.22.x
			
	> Drain the node
			> kubectl drain <node-to-drain> --ignore-daemonsets
			
	> Upgrade kubelet and kubectl
			> yum install -y kubelet-1.22.x-0 kubectl-1.22.x-0 --disableexcludes=kubernetes
	> Restart the kubelet:
			> sudo systemctl daemon-reload
			> sudo systemctl restart kubelet
	
	> Uncordon the node
			> kubectl uncordon <node-to-drain>
			
