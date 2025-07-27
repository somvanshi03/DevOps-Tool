# GCP IAM

## IAM Role 
```t
# IAM Permission Example

# IAM Permission: Permissions are operations that allowed on a resources
# Example:

compute.instance.create
compute.instance.list
compute.instance.start
compute.instance.stop

# What is IAM Roles?
IAM Role is a collection of Permission

# Example:
Compute Admin, Storage Admin 

# IAM Role Type:
# Basic Roles(Privileged Roles): 
	Owner > Full Access
	Editor: Edit + View
	Viewer: View only Or Read only
# Predefined Roles
	Predefined Roles: Precreated by Google and ready to use.
	# Example:
	  compute Admin
	  Compute Viewer
	  Compute Network Admin
	  compute Network Viewer
	
# Custom Roles
	We can create new role by assigning desired permission to it.
	# Example
	  CustomRole101
	  [compute.instance.start,compute.instance.stop]
```
```t 
#Principle: 
Principle are users, groups, domains or service account
```
## IAM Policy
```t 
# IAM Role binding
	Binding one or more Principle to an individual IAM Role 
	Principle or members + IAM Role
# IAM Policy(Default: Allow Policy)
	* Collection of Role bindings that binds one or more Principle to an individual Role
	* IAM Policy can have one or more role bindings.
	* An Allow Policy is attachated to a resources.
	Example: Org, Folder, Projects or Cloud resources
	(Storage Bucket, VM instance)


```