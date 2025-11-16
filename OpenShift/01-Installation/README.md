# OpenShift 

### Step 1: Log in to OpenShift

	First, log in to your OpenShift cluster using the `oc login` command:

	oc login https://your-openshift-cluster-api:6443


### Step 2: Create a New Project (Optional)
	
	You can create a new project for your application, but this step is optional if you already have a project:


	oc new-project my-project


### Step 3: Create an Application

	You can create an application from a source code repository using the `oc new-app` command. Here’s an example using a Git repository:


	oc new-app https://github.com/sclorg/nodejs-ex -l app=nodejs-ex


	This command will create a new application based on the source code from the specified Git repository. The `-l app=nodejs-ex` option adds a label to the application for easier identification.

### Step 4: Expose the Application

	Expose the application to create a route, making it accessible from outside the cluster:


	oc expose svc/nodejs-ex


### Step 5: Verify the Application

	To verify that the application has been created and is running, use the following command:


	oc get pods


	This will list all the pods in your current project, and you should see the pod for your application in the list.

	You can also get the URL for your application using:


	oc get route


	This will display the URL you can use to access your application.

	That's it! You've successfully created an application in OpenShift using the CLI. If you have any more questions or need further assistance, feel free to ask!