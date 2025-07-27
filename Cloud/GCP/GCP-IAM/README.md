# GCP IAM

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