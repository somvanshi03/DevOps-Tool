# HelmChart

	Helm is a package manager for Kubernetes that uses a packaging format called **charts**. 
	
	Helm commands are used to install, manage, upgrade, and configure Kubernetes applications. 
	
	Below is a **comprehensive list of Helm CLI commands**, with **detailed explanations** for each.



## 📦 Helm Chart Commands (Detailed)

## Helm chart repo 

	https://artifacthub.io/ 
		
		
## Helm Commands (List, add, search)

	helm repo list # Will show which remote repo is added in your local helm server
	
	helm repo add bitnami101 https://charts.bitnami.com/bitnami
	
	helm repo remove bitnami101
	
	helm repo list 
	
	helm search repo nginx 
	
	helm search repo nginx --version 	
	
	helm repo update 
	
	helm install myfirstrepo bitnami101/nginx  # latest chart will be installed 
	
	helm list 
	
	helm ls --output=yaml 

	helm list --namespace=default
	
	kubectl get ns 

	helm ls 
	
	helm uninstall myfirstrepo
	
	helm list 


## Helm Upgrade with set option

	helm repo list 
	
	helm repo add stacksimplify https://stacksimplify.github.io/helm-charts/
	
	helm repo list

	helm search repo mychart1 
	
	helm search repo mychart1 --versions

	helm install myapp1 stacksimplify/mychart1 
	
	helm ls 
	
	helm list 

	helm upgrade myapp1 stacksimplify/mychart1 --set "image.tag=2.0.0"
	
	helm ls
	
	helm list 
	
	Note: New version of docker image will be deployed.
	
	helm list --deployed 
	
	helm list --suerseded
	
## Helm history and status 

	helm history myapp1
	
	helm status myapp1

	helm status myapp1 --show-desc
	
	helm status myapp1  --show-resources 
	
	helm status RELEASE_NAME --revision int
	
	helm status myapp1 --revision 2


## Helm Uninstall

	helm uninstall myapp1
	
	

## Upgrade the charts via chart no 

	helm search repo mychart2
	
	helm search repo mychart2 --versions 
	
	helm search repo mychart2 --version "0.3.0"
	
	helm install myapp1 stacksimplify/mychart2 --version "0.1.0"
	
	helm list 
	
	helm status myapp1 --show-resources

	helm upgrade myapp1 stacksimplify/mychart2 --version "0.2.0"
	
	helm list 
	
	helm ls 
	
	helm status myapp1 --show-resources
	
	

## Rollback 

	helm history myapp1
	
	helm list 
	
	helm rollback myapp1
	
	helm status myapp1
	
	helm list 
	
	helm history myapp1
	
	helm rollback myapp1 1 #1 is revision no 



## Uninstall with keep history 

	helm list 
	
	helm list --suerseded
	
	helm list --deployed
	
	helm history myapp1
	
	helm uninstall myapp1 --keep-history
	
	helm list --uninstalled 
	
	helm status myapp1
	
## Rollback Uinstalled Release 

	helm history myapp1
	
	helm rollback myapp 3 
	
	helm list 
	
	helm history myapp1
	
	helm status myapp1 --show-resources
	

## Install with generate-name flag 

	
	helm list 
	
	helm install stacksimplify/mychart2 --generate-name 
	
	helm status mychart2******


## Helm Install Atomic Flag
```t
# To remove all added repositories in Helm, you can use the following command:
helm repo list -o json | jq -r '.[].name' | xargs -n1 helm repo remove
	
# Install Repo
helm install dev101 stacksimplify/mychart1

# List Helm Release
helm list 

# List Kubernetes Resources Deployed as part of this Helm Release
helm status dev101 --show-resources

# Access Application
http://localhost:31231


# Install Helm Chart 
helm install qa101 stacksimplify/mychart1

# List Helm Release
helm list 
Observation: You should see qa101 release installed with FAILED status

Error: INSTALLATION FAILED: 1 error occurred:
	* Service "qa101-mychart1" is invalid: spec.ports[0].nodePort: Invalid value: 31231: provided port is already allocated

# Uninstall qa101 release which is in failed state
helm uninstall qa101

# List Helm Release
helm list 
	
	
# Install Helm Chart 
helm install qa101 stacksimplify/mychart1 --atomic

# List Helm Release
helm list 
Observation: We will not see qa101 FAILED release, --atomic flag deleted the release as soon as it is failed with error

Error: INSTALLATION FAILED: 1 error occurred:
	* Service "qa101-mychart1" is invalid: spec.ports[0].nodePort: Invalid value: 31231: provided port is already allocated


# Uninstall dev101 release
helm uninstall dev101

# List Helm Releases
helm list
```	

## Helm with Kubernetes Namespaces
```t
# To remove all added repositories in Helm, you can use the following command:
helm repo list -o json | jq -r '.[].name' | xargs -n1 helm repo remove
	
# List Kubernetes Namespaces 
kubectl get ns

# Install Helm Release by creating Kubernetes Namespace
helm install dev101 stacksimplify/mychart2 --version "0.1.0" --namespace dev --create-namespace 

# List Kubernetes Namespaces 
kubectl get ns
Observation: Found the dev namespace created as part of `helm install`

# List Helm Release
helm list --> NO RELEASES in default namespace
helm list -n dev
helm list --namespace dev

# Helm Status
helm status dev101 --show-resources -n dev
helm status dev101 --show-resources --namespace dev

# List Kubernetes Pods
kubectl get pods -n dev
kubectl get pods --namespace dev

# List Services
kubectl get svc -n dev

# List Deployments
kubectl get deploy -n dev

# Access Application
http://localhost:31232
	
	
# Helm Upgrade
helm upgrade dev101 stacksimplify/mychart2 --version "0.2.0" --namespace dev 
or
helm upgrade dev101 stacksimplify/mychart2 --version "0.2.0" -n dev

# List Helm Release
helm list -n dev
helm list --namespace dev

# Helm Status
helm status dev101 --show-resources -n dev
helm status dev101 --show-resources --namespace dev

# Access Application
http://localhost:31232
	
	
# Uninstall Helm Releas
helm uninstall dev101 --namespace dev
helm uninstall dev101 -n dev

# List Helm Release
helm list -n dev
helm list --namespace dev

# List Kubernetes Namespaces
kubectl get ns
Observation: 
1. When uninstalling helm release, it will not delete the Kubernetes Resource: dev namespace. 
2. If we dont need that dev namespace we need to manually delete it from kubernetes using kubectl

# Delete dev namespace
kubectl delete ns dev

# List Kubernetes Namespaces
kubectl get ns
```	

## Helm Override default values from values.yaml
```t 
# To remove all added repositories in Helm, you can use the following command:
helm repo list -o json | jq -r '.[].name' | xargs -n1 helm repo remove

# Helm Install with --dry-run command
helm install myapp901 stacksimplify/mychart1 --set service.nodePort=31240 --dry-run 

# Helm Install with --dry-run and --debug command
helm install myapp901 stacksimplify/mychart1 --set service.nodePort=31240 --dry-run --debug

## THE BELOW IS THE SAMPLE OUTPUT WITH DEBUG ADDED
NAME: myapp901
NAMESPACE: default
STATUS: pending-install
REVISION: 1
	USER-SUPPLIED VALUES:
service:
  nodePort: 31240
COMPUTED VALUES:
fullnameOverride: ""
image:
  pullPolicy: IfNotPresent
  repository: ghcr.io/stacksimplify/kubenginx
  tag: ""
nameOverride: ""
podAnnotations: {}
replicaCount: 1
service:
  nodePort: 31240
  port: 80
  type: NodePort

  	  
# Helm Install 
helm install myapp901 stacksimplify/mychart1 --set service.nodePort=31240 

# helm status --show-resources
helm status myapp901 --show-resources
Observation:
We can see that our NodePort service is running on port 31240

# Access Application
http://localhost:31240
```	
	
	# Change-1: change replicas from 1 to 2
	replicaCount: 2

	# Change-2: Add tag as "2.0.0" which will override the default appversion "1.0.0" from our mychart1
	image:
	  repository: ghcr.io/stacksimplify/kubenginx
	  pullPolicy: IfNotPresent
	  # Overrides the image tag whose default is the chart appVersion.
	  tag: "2.0.0"

	# Change-3: Change nodePort from 31240 to 31250
	service:
	  type: NodePort
	  port: 80
	  nodePort: 31250
	  
	  
```t	  
# Verify if myvalues.yaml
cd 09-Helm-Override-Values
cat myvalues.yaml

# helm upgrade with --dry-run and --debug commands
helm upgrade myapp901 stacksimplify/mychart1 -f myvalues.yaml --dry-run --debug

# helm upgrade
helm upgrade myapp901 stacksimplify/mychart1 -f myvalues.yaml

# helm status
helm status myapp901 --show-resources
Observation: 
1. Two pods will be running as we changed replicacount to 2
2. Service Node Port will be 31250 

# Access Application
http://localhost:31250
Observation: 
1. We should see V2 application because we have used the "image tag as 2.0.0"
	
	
	
# helm get values
helm get values RELEASE_NAME
helm get values myapp901
Observation:
1. Provides the values from current/latest release version 2 from Release myapp901
```
	## Sample Output
	Kalyans-MacBook-Pro:09-Helm-Override-Values kalyan$ helm get values myapp901
	USER-SUPPLIED VALUES:
	image:
	  pullPolicy: IfNotPresent
	  repository: ghcr.io/stacksimplify/kubenginx
	  tag: 2.0.0
	replicaCount: 2
	service:
	  nodePort: 31250
	  port: 80
	  type: NodePort

```t
# helm history (History prints historical revisions for a given release.)
helm history myapp901


# helm get values with --revision
helm get values RELEASE-NAME --revision int
helm get values myapp901 --revision 1

## Sample Output
Kalyans-MacBook-Pro:09-Helm-Override-Values kalyan$ helm get values myapp901 --revision 1
USER-SUPPLIED VALUES:
service:
	nodePort: 31240
	  
# helm get manifest
helm get manifest RELEASE-NAME
helm get manifest myapp901

# helm get manifest --revision
helm get manifest RELEASE-NAME --revision int
helm get manifest myapp901 --revision 1
	
	
# helm get all
helm get all RELEASE-NAME
helm get all myapp901
	
	
# Uninstall Helm Release
helm uninstall myapp901

# List Helm Releases
helm list
	
	
# Release: myapp901
helm install myapp901 stacksimplify/mychart1 --atomic
helm list
helm status myapp901 --show-resources
http://localhost:31231

# Release: myapp902
helm install myapp902 stacksimplify/mychart1 --atomic
helm list

# Option-1: Give desired port other than 31231
helm install myapp902 stacksimplify/mychart1 --set service.nodePort=31232 

# Option-2: Pass null value to nodePort (service.nodePort=null)
helm install myapp902 stacksimplify/mychart1 --set service.nodePort=null --dry-run --debug
helm install myapp902 stacksimplify/mychart1 --set service.nodePort=null 

# Additional Notes for understanding
1. We will choose option-2 to demonstrate the concept "Deleting a default Key by passing null"
2. For NodePort Service, if we dont define the "nodePort" argument, it by default assigns a port dynamically from the port range 30000-32767. 
3. In our case already 31231 is used, other than that port it will allocate someother port when we pass null. 
4. In short, if we dont want to pass the default values present in values.yaml as-is, we dont need to change the complete chart with a new version, we can just pass null.

# Uninstall Releases
helm uninstall myapp901
helm uninstall myapp902
helm list
```

## Understand Helm Chart Folder Structure

```t
# Helm Create Chart
helm create <CHART-NAME>
helm create basechart
Observation: 
1. It will create a Helm Chart template 
2. We can call it like a helm chart created from a default starter chart


└── basechart
    ├── .helmignore
    ├── Chart.yaml
    ├── LICENSE
    ├── README.md
    ├── charts
    ├── templates
    │   ├── NOTES.txt
    │   ├── _helpers.tpl
    │   ├── deployment.yaml
    │   ├── hpa.yaml
    │   ├── ingress.yaml
    │   ├── service.yaml
    │   ├── serviceaccount.yaml
    │   └── tests
    │       └── test-connection.yaml
    └── values.yaml
	
```
## Helm Builtin Objects

```t
    Objects are passed into a template from the template engine.
    Objects can be simple, and have just one value or they can contain other objects or functions.
    For example: the Release object contains several objects (like .Release.Name) and the Files object has a few functions.


# Helm Builtin Objects
    Release
    Chart
    Values
    Capabilities
    Template
    Files

{{/* Release Object */}}
Release Name: {{ .Release.Name }}
Release Namespace: {{ .Release.Namespace }}
Release IsUpgrade: {{ .Release.IsUpgrade }}
Release IsInstall: {{ .Release.IsInstall }}
Release Revision: {{ .Release.Revision }}
Release Service: {{ .Release.Service }}

# Char Details
https://helm.sh/docs/topics/charts/#the-chartyaml-file
Put the below in NOTES.txt and test it

# Helm Install with --dry-run
helm install myapp101 . --dry-run


# Helm Objects: Values, Capabilities, Template

{{/* Values Object */}}
Replica Count: {{ .Values.replicaCount }}
Image Repository: {{ .Values.image.repository }}
Service Type: {{ .Values.service.type }}

{{/* Capabilities Object */}}
Kubernetes Cluster Version Major: {{ .Capabilities.KubeVersion.Major }}
Kubernetes Cluster Version Minor: {{ .Capabilities.KubeVersion.Minor }}
Kubernetes Cluster Version: {{ .Capabilities.KubeVersion }} and {{ .Capabilities.KubeVersion.Version }}
Helm Version: {{ .Capabilities.HelmVersion }}
Helm Version Semver: {{ .Capabilities.HelmVersion.Version }}

{{/* Template Object */}}
Template Name: {{ .Template.Name }} 
Template Base Path: {{ .Template.BasePath }}

# Change to CHART Directory 
cd builtinobjects 

# Helm Install with --dry-run
helm install myapp101 . --dry-run

# Sample Output
Replica Count: 1
Image Repository: ghcr.io/stacksimplify/kubenginxhelm
Service Type: NodePort

Kubernetes Cluster Version Major: 1
Kubernetes Cluster Version Minor: 27
Kubernetes Cluster Version: v1.27.2 and v1.27.2
Helm Version: {v3.12.1 f32a527a060157990e2aa86bf45010dfb3cc8b8d clean go1.20.5}
Helm Version Semver: v3.12.1

Template Name: builtinobjects/templates/NOTES.txt 
Template Base Path: builtinobjects/templates

# Helm Objects: Files


Files Object:
Put the below in NOTES.txt and test it
https://helm.sh/docs/chart_template_guide/accessing_files/

{{/* File Object */}}
File Get: {{ .Files.Get "myconfig1.toml" }}
File Glob as Config: {{ (.Files.Glob "config-files/*").AsConfig }}
File Glob as Secret: {{ (.Files.Glob "config-files/*").AsSecrets }}
File Lines: {{ .Files.Lines "myconfig1.toml" }}
File Lines: {{ .Files.Lines "config-files/myconfig2.toml" }}
File Glob: {{ .Files.Glob "config-files/*" }}

# Change to CHART Directory 
cd builtinobjects 

# Helm Install with --dry-run
helm install myapp101 . --dry-run

# Sample Output
File Get: message1 = Hello from config 1 line1
message2 = Hello from config 1 line2
message3 = Hello from config 1 line3

File Glob as Config: myconfig2.toml: |-
  appName: myapp2
  appType: db
  appConfigEnable: true
myconfig3.toml: |-
  appName: myapp3
  appType: app
  appConfigEnable: false
File Glob as Secret: myconfig2.toml: YXBwTmFtZTogbXlhcHAyCmFwcFR5cGU6IGRiCmFwcENvbmZpZ0VuYWJsZTogdHJ1ZQ==
myconfig3.toml: YXBwTmFtZTogbXlhcHAzCmFwcFR5cGU6IGFwcAphcHBDb25maWdFbmFibGU6IGZhbHNl
File Lines: [message1 = Hello from config 1 line1 message2 = Hello from config 1 line2 message3 = Hello from config 1 line3 ]
File Lines: [appName: myapp2 appType: db appConfigEnable: true]
File Glob: map[config-files/myconfig2.toml:[97 112 112 78 97 109 101 58 32 109 121 97 112 112 50 10 97 112 112 84 121 112 101 58 32 100 98 10 97 112 112 67 111 110 102 105 103 69 110 97 98 108 101 58 32 116 114 117 101] config-files/myconfig3.toml:[97 112 112 78 97 109 101 58 32 109 121 97 112 112 51 10 97 112 112 84 121 112 101 58 32 97 112 112 10 97 112 112 67 111 110 102 105 103 69 110 97 98 108 101 58 32 102 97 108 115 101]]

```

## Helm Development Basics

```t 
Template Actions {{ }}
Action Elements {{ .Release.Name }}
Quote Function
Pipeline
default Function
lower function
Controlling White Spaces {{-  -}}
indent function
nindent function
toYaml

# Template Action "{{ }}"
Anything in between Template Action {{ .Chart.Name }} is called Action Element
Anything in between Template Action {{ .Chart.Name }} will be rendered by helm template engine and replace necessary values
Anything outside of the template action will be printed as it is.
Action elements defined inside the {{ }} will help us to retrieve data from other sources (example: .Chart.Name).

# Template Function: quote
# Add Quote Function 
  annotations:    
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    # quote function
    app.kubernetes.io/managed-by: {{ quote .Release.Service }} 

# Change to CHART Directory
cd helmbasics

# Helm Template Command
helm template myapp101 .

# Pipeline
# Add Quote Function with Pipeline
  annotations:    
    app.kubernetes.io/managed-by: {{ .Release.Service }}
    # quote function
    app.kubernetes.io/managed-by: {{ quote .Release.Service }} 
    # quote function with pipeline
    app.kubernetes.io/managed-by: {{ .Release.Service | quote }}               

# Change to CHART Directory
cd helmbasics

# Helm Template Command
helm template myapp101 .
```

## Create and Package Helm Charts

```t 
#Introduction:
We will learn the following things
helm create to create a new Helm Chart
Update the Chart with basic information like our Docker Image, appversion, chart version
Update the Chart to support to NodePort Service, helm install and test
helm package
helm package --app-version --version
https://github.com/users/stacksimplify/packages/container/package/kubenginx 

# Helm Create Chart

helm create <CHART-NAME>
helm create myfirstchart
Observation: 
1. It will create a base Helm Chart template 
2. We can call it as a starter chart. 

# Update values.yaml with our Application Docker Image
image:
  repository: ghcr.io/stacksimplify/kubenginx
  pullPolicy: IfNotPresent
  # Overrides the image tag whose default is the chart appVersion.
  tag: ""
  
# Convert the Kubernetes Service to NodePort
# Update values.yaml
service:
  type: NodePort
  port: 80 
  nodePort: 31231

# Update templates/service.yaml
nodePort: {{ .Values.service.nodePort }}

# Update Chart.yaml
### Chart Version and Description
# Before
version: 0.1.0
description: A Helm chart for Kubernetes

# After
version: 1.0.0
description: A Helm Chart with NodePort Service

### appVersion
# Before
appVersion: "1.16.0"

# After (update our Docker Image tag version)
appVersion: "1.0.0"

# Helm Install - Chart Version 1.0.0 and Test it
# Helm Install
cd myfirstchart
helm install myapp1v1 .

# List Helm Releases
helm list
helm list --output=yaml

# Helm Status
helm status myapp1v1 --show-resources

# Using kubectl commands
kubectl get pods
kubectl get svc

# Access in Browser
http://127.0.0.1:31231
http://localhost:31231

# Helm Package - v1.0.0
# Check if you are  in Directory
25-Helm-Create-and-Package-Chart

# Helm Package
helm package myfirstchart/ --destination packages/
or
helm package myfirstchart/ -d packages/

# Review Package file
cd pakcages
ls -lrta
Package file name: myfirstchart-1.0.0.tgz

# Helm Package - v2.0.0
### Chart Version and Description
# Before
version: 1.0.0
description: A Helm Chart with NodePort Service

# After
version: 2.0.0
description: A Helm Chart with NodePort Service

### appVersion
# After (update our Docker Image tag version)
appVersion: "1.0.0"

# After (update our Docker Image tag version)
appVersion: "2.0.0"

# Helm Package
helm package myfirstchart/ --destination packages/
helm package myfirstchart/ -d packages/

# Review Package file
cd pakcages
ls -lrta
Package file name: myfirstchart-1.0.0.tgz
Package file name: myfirstchart-2.0.0.tgz

# Helm Install by path to a packaged chart and Verify
# Helm Install
helm install myapp1v2 packages/myfirstchart-2.0.0.tgz --set service.nodePort=31232

# Using kubectl commands
kubectl get pods
kubectl get svc

# List Helm Releases
helm list
helm list --output=yaml

# Helm Status
helm status myapp1v2 --show-resources

# Access in Browser
http://127.0.0.1:31232
http://localhost:31232

# Helm Package with --app-version, --version
# Helm Package  --app-version
helm package myfirstchart/ --app-version "3.0.0" --version "3.0.0" --destination packages/

# Helm Install and Test if --version "3.0.0" worked
# Helm Install from package
helm install myapp1v3 packages/myfirstchart-3.0.0.tgz --set service.nodePort=31233

# Using kubectl commands
kubectl get pods
kubectl get svc

# List Helm Releases
helm list
helm list --output=yaml

# Helm Status
helm status myapp1v3 --show-resources

# Access in Browser
http://127.0.0.1:31233
http://localhost:31233
Observation:
1. We can see V3 version of Application 

# Uninstall Helm Releases
# List Helm Releases
helm list
helm list --output=yaml

# Uninstall Helm Releases
helm uninstall myapp1v1
helm uninstall myapp1v2
helm uninstall myapp1v3

# Helm Show Commands
# Helm Show Chart
helm show chart myfirstchart/
helm show chart packages/myfirstchart-2.0.0.tgz

# Helm Show Values
helm show values myfirstchart/
helm show values packages/myfirstchart-2.0.0.tgz

# Helm Show readme
helm show readme myfirstchart/

# Helm Show All
helm show all myfirstchart/
helm show all packages/myfirstchart-2.0.0.tgz
```

## Helm Subcharts - Dependency Command

```t 

Create Parent Chart
helm dependency list
helm dependency update
helm dependency build
helm dependency version constraints
helm dependency repository @REPO vs REPO-URL

# Create Parent Chart

# Create Parent Chart
helm create parentchart

apiVersion: v2
name: parentchart
description: A Helm chart for Kubernetes
type: application
version: 0.1.0
appVersion: "1.16.0"
dependencies:
- name: mychart1
  version: "0.1.0"
  repository: "https://stacksimplify.github.io/helm-charts/"
- name: mychart2
  version: "0.4.0"
  repository: "https://stacksimplify.github.io/helm-charts/"
- name: mysql
  version: "9.9.0"
  repository: "https://charts.bitnami.com/bitnami"
  
  
# Helm Dependency Commands - List and Update
# Helm Dependency List
helm dependency list
Observation: 
You should see status "missing" because we still didnt do helm dependency update

# Verify Charts folder in parentchart
ls parentchart/charts
Observation: it should be empty. Dependency subcharts not downloaded

# Helm Dependency Update
helm dependency update CHART-NAME
helm dependency update parentchart/
ls parentchart/charts
Observation: 
1. We should see both charts (mychart1-0.1.0.tgz, mychart2-0.4.0.tgz, mysql-9.9.0.tgz)downloaded to "parentchart/charts" folder
2. We should see "Chart.lock" file in "parentchart" folder

# Review Chart.lock file
cat parentchart/Chart.lock 

# Helm Dependency list
helm dependency list parentchart/
Observation: Should see status as "OK"

# Helm Dependency Chart Version Ranges
Updates to parent chart Chart.yaml

Helm Chart Version Notation: Major.Minor.Patch 
MySQL Helm Chart Version: 9.10.8
Major: 9
Minor: 10
Patch: 8
```

## Helm Plugins

```t 
# Install Helm Plugin

# List Helm Plugins
helm plugin list

# Install Helm Plugins
helm plugin install https://github.com/salesforce/helm-starter.git

# List Helm Plugins
helm plugin list

# Helm env
helm env 
Observation:
1. Find the value for HELM_PLUGINS
HELM_PLUGINS="/Users/kalyan/Library/helm/plugins"

# Verify in Helm plugins directory
cd /Users/kalyan/Library/helm/plugins
ls

# Play with Helm Starter Plugin
# List Helm Starters
helm plugin list
helm <PLUGIN-NAME> <PLUGIN-SUB-COMMAND-AS-PER-PLUGIN>
helm starter list

# Fetch Helm Starter
helm starter fetch https://github.com/salesforce/helm-starter-istio.git

# List Helm Starters
helm starter list


# Play with Helm Plugin Commands
# Update Helm Plugin
helm plugin list
helm plugin update PLUGIN-NAME
helm plugin update starter

# Uninstall Helm Plugin
helm plugin list
helm plugin uninstall PLUGIN-NAME
helm plugin uninstall starter
helm plugin list

# Install Couple of Releases
# Helm Rep Add
helm repo list
helm repo add stacksimplify https://stacksimplify.github.io/helm-charts/
helm repo list

# Helm Install dev101
helm install dev101 stacksimplify/mychart1 --atomic
helm upgrade dev101 stacksimplify/mychart1 --atomic --set replicaCount=2
helm upgrade dev101 stacksimplify/mychart1 --atomic --set replicaCount=3

# Helm Install dev102
helm install dev102 stacksimplify/mychart2 --atomic

# List Helm Releases
helm list

# (Optional) Lets install Helm Dashboard Plugin
# List Helm Plugins
helm plugin list

# Install Helm Plugin
helm plugin install https://github.com/komodorio/helm-dashboard.git

# Start Helm Plugin: dashboard
helm dashboard

# Review Dashboard Concepts
1. Clusters
2. Installed Charts
    - Release: dev101 
        - Resources
        - Manifests
        - Values
        - Notes
    - Revision: 1, 2, 3 
    - Revision Differences
3. Repository
4. Logout 

# Uninstall Releases
# Helm Uninstall
helm uninstall dev101
helm uninstall dev102
```

## Helm Charts Sign and Verify

```t 
GnuPG
Generating Private/Public Keys with gpg
Sign the Helm Package
Export public key
Verify Helm Package using Public Key

# Install gnupg
# Install gnupg on MacOS
brew install gnupg

# Verify version
gpg --version



# Install gnupg on WindowsOS
choco install gnupg

# Verify version
gpg --version


# Generate Private/Public Key Pairs with gpg
# List Keys
gpg --list-keys

# Generating Private/Public Keys with gpg
gpg --full-generate-key
-> kind of key: Select 1 (1) RSA and RSA
-> What keysize do you want? (3072) 
-> Please specify how long the key should be valid.
-> Key is valid for? (0) "0 = key does not expire"
-> Is this correct? (y/N) 
-> Real name: helmsigndemo1
-> Email address: helmsigndemo1@gmail.com
-> Comment: Keys used to sign Helm Charts
-> Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
-> Passphrase: helm1234

# List Keys
gpg --list-keys

# Convert new secret keyring to old format
gpg --export-secret-keys >~/.gnupg/helmsigndemo1-secring-privatekey.gpg
Passphrase: helm1234
Additional Notes:
1. To sign charts, Helm currently prefers the older format. 
2. Convert the new secret keyring format to the old format and store it in a file called secring.

# Verify if file created
ls ~/.gnupg/helmsigndemo1-secring-privatekey.gpg

# Copy the private key to course directory
cd 43-Helm-Sign-and-Verify-Charts 
cp ~/.gnupg/helmsigndemo1-secring-privatekey.gpg myhelmcharts/private-key/

# Export private key with single command (instead of export in .gnupg folder and copy to private-key folder)
cd myhelmcharts
gpg --export-secret-keys > private-key/helmsigndemo1-secring-privatekey.gpg


# Signing Helm Charts
# Change Directory
cd myhelmcharts
1. we will have the "myfirstchart" helm chart folder

# Sign & Package Helm Chart 
helm package --sign --key 'helmsigndemo1' --keyring private-key/helmsigndemo1-secring-privatekey.gpg myfirstchart/
Passphrase: helm1234

# Verify the Provenance file created
ls -lrta
1. We should find the file "myfirstchart-2.0.0.tgz.prov" ending with ".prov"



# Export Public Key
# Change to Directory 
cd myhelmcharts

# Export Public Key
gpg --export 'helmsigndemo1' > public-key/helmsigndemo1-publickey.gpg

# Verify if file created
ls public-key/helmsigndemo1-publickey.gpg


# Verify Helm Package using Public Key
# Change Directory
cd myhelmcharts

# Helm Verify
helm verify --keyring public-key/helmsigndemo1-publickey.gpg myfirstchart-0.1.0.tgz

## Sample Output
Kalyans-Mac-mini:myhelmcharts kalyanreddy$ helm verify --keyring public-key/helmsigndemo1-publickey.gpg myfirstchart-0.1.0.tgz
Signed by: helmsigndemo1 (Keys used to sign Helm Charts) <helmsigndemo1@gmail.com>
Using Key With Fingerprint: 0494EA24668AE1516A31E5EC467D1996D2158381
Chart Hash Verified: sha256:099c8a0cd0609f0e252bd63856ea1998c55e4af1b587c435d4b74d33283e0ad4
Kalyans-Mac-mini:myhelmcharts kalyanreddy$ 


# Verify Charts during helm install and Upgrade - Positive Test
# Change Directory
cd myhelmcharts

# Helm Install with --verify 
helm install myapp1 myfirstchart-0.1.0.tgz --verify --keyring public-key/helmsigndemo1-publickey.gpg --atomic

# List Helm Release
helm list

# Helm Status
helm status --show-resources

# Access Application
http://localhost:31239

# Helm Upgrade with --verify 
helm upgrade myapp1 myfirstchart-0.1.0.tgz --verify --keyring public-key/helmsigndemo1-publickey.gpg --atomic --set image.tag="0.2.0"

# Uninstall Helm Release
helm uninstall myapp1


# Verify Charts during helm install and Upgrade - Negative Test
# Change Directory
cd myhelmcharts

# Create some dummy file in public-key folder
touch public-key/dummy-publickey.gpg

# Helm Install with --verify 
helm install myapp1 myfirstchart-0.1.0.tgz --verify --keyring public-key/dummy-publickey.gpg --atomic
Observation:
1. Should throw an error as below

## Sample Output
Kalyans-Mac-mini:myhelmcharts kalyanreddy$ helm install myapp1 myfirstchart-0.1.0.tgz --verify --keyring public-key/dummy-publickey.gpg --atomic
Error: INSTALLATION FAILED: openpgp: signature made by unknown entity
Kalyans-Mac-mini:myhelmcharts kalyanreddy$ 
```
## OCI Registry: Docker Hub
```t 
# SigUp and SignIn to Docker Hub
https://hub.docker.com

# command line: docker login
docker login
Username: xxxxxxxxx
Password: xxxxxxxxx

# Push Helm Chart to Docker Hub
cd 47-Helm-Use-OCI-based-Registries
helm push <HELM-PACKAGE>  oci://registry-1.docker.io/<DOCKER-NAMESPACE>
helm push myocidemo-0.1.0.tgz  oci://registry-1.docker.io/stacksimplify

# Verify ons Docker Hub
Review Tabs
1. General
2. Tags

# Update and Push Chart Version: 0.2.0

# Package with Chart Version and App Version 0.2.0
helm package myocidemo --version "0.2.0" --app-version "0.2.0"

# Push Helm Chart to Docker Hub
helm push myocidemo-0.2.0.tgz  oci://registry-1.docker.io/stacksimplify

# Pull Helm Chart from OCI Registry
# Create Directory
mkdir mypackages

# Helm Pull
helm pull oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0
helm pull oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.2.0

# Helm Template and Show Commands
# Helm Template Command
helm template <my-release> oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0
helm template myapp1 oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0
helm template myapp1 oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.2.0

# Helm Show Command
helm show all oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0
helm show all oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.2.0

# Helm Install and Upgrade from OCI Registry
# Helm Install
helm install <my-release> oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0
helm install myapp1 oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.1.0

# Helm Status
helm status myapp1 --show-resources 

# List k8s services
kubectl get svc

# Access Application
http://localhost:<get-from-svc-output>

# Helm Upgrade
helm upgrade <my-release> oci://registry-1.docker.io/stacksimplify/myocidemo --version 0.2.0

# List k8s services
kubectl get svc

# Access Application
http://localhost:<get-from-svc-output>


# Migrate from Classic Chart Repository to OCI Registry
# List and add Helm Chart Repository
helm repo list
helm repo add mygithelmrepo https://stacksimplify.github.io/helm-charts-repo/
helm repo update

# Search Helm Repository
helm search repo myfirstchart

# Create folder migrate
mkdir migrate
cd migrate

# Helm Pull (downloads latest chart version - in our case it is 0.2.0)
helm pull mygithelmrepo/myfirstchart

# Helm Pull --version (downloads specified chart version)
helm pull mygithelmrepo/myfirstchart --version 0.1.0

# Docker Login (if not logged in)
docker login

# Helm Push
helm push myfirstchart-0.1.0.tgz  oci://registry-1.docker.io/stacksimplify
helm push myfirstchart-0.2.0.tgz  oci://registry-1.docker.io/stacksimplify

# Verify on Docker Hub
https://hub.docker.com
``` 
