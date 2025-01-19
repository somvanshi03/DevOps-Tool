# Install JenkinsX 

### Prerequisites
	- **Minikube** installed and running.
	- **kubectl** installed and configured to access your Minikube cluster.
	- **Jenkins X CLI** installed.
	- **Helm** installed.
	- **Git** installed (for source control).

### Steps to Set Up Jenkins X with Minikube

#### 1. **Start Minikube Cluster**

	If you haven't already started Minikube, you can start it with the following command:


	minikube start


	You can specify a specific Kubernetes version or resources if needed using options like `--kubernetes-version`, `--cpus`, `--memory`, etc. But for a standard setup, the default should work fine.

#### 2. **Install Helm**

	If you don't have Helm installed, follow the instructions from the official Helm documentation. For most systems, you can use the following:


	curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash


	Once Helm is installed, ensure it is configured to use your Minikube's Kubernetes cluster:


	kubectl config use-context minikube


#### 3. **Install Jenkins X CLI**

	To install the Jenkins X CLI (jx), you can run the following command:


	curl -L https://github.com/jenkins-x/jx/releases/download/v3.3.221/jx-linux-amd64.tar.gz | tar xzv
	sudo mv jx /usr/local/bin/


	Verify the installation by running:


	jx --version


#### 4. **Configure Helm for Jenkins X**

	You can now install Helm into your Minikube cluster. Jenkins X relies on Helm for managing releases and deploying applications.

	Install Jenkins X using the following command:


	jx install --provider=helm


	This will install the Jenkins X platform into your Minikube cluster using Helm.

#### 5. **Create a Jenkins X Project**

	Jenkins X allows you to create projects quickly and configure CI/CD pipelines. To create a new project, you can use the following command:


	jx create quickstart


	This will prompt you to choose the type of application you want to create (e.g., Node.js, Python, etc.). You can choose the one that best suits your needs.

#### 6. **Verify the Jenkins X Installation**

	Once the installation completes, verify Jenkins X has been installed successfully by checking for the Jenkins X resources in your cluster:


	kubectl get all -n jx


	You should see various Jenkins X components like `jx` and `tiller` running in the `jx` namespace.

#### 7. **Access Jenkins X Dashboard (Optional)**

	Jenkins X provides a web dashboard to interact with your projects. To expose the Jenkins X dashboard via port forwarding, use the following command:


	kubectl port-forward svc/jx-console 8080:80 -n jx


	Now, you can access the Jenkins X dashboard in your browser by going to [http://localhost:8080](http://localhost:8080).

#### 8. **Set Up GitOps**

	If you want to set up GitOps with Jenkins X (which is a common pattern for Jenkins X), you can use the `jx gitops` command to connect your Git repositories for managing the Kubernetes resources.


	jx create spring -d gitops=true


	This will create a GitOps pipeline for managing your application using Git-based workflows.

#### 9. **Verify Pipeline**

	Once the project is created, Jenkins X will automatically set up the CI/CD pipeline for your application. You can view the pipeline’s progress by running:


	jx get pipeline


	This will show the status of your pipelines.

#### 10. **Stop and Restart Minikube (Optional)**

	If you ever stop your Minikube cluster (e.g., `minikube stop`), just restart it with `minikube start`, and your Jenkins X setup should remain intact. Ensure that your `kubectl` context is still pointing to Minikube:

	kubectl config use-context minikube


### Final Notes:
	- Jenkins X on Minikube is primarily for development or testing purposes. If you're looking for production deployment, it's recommended to use a cloud-based Kubernetes service.
	- For persistent storage in Minikube, you may need to configure persistent volumes or use a Minikube feature like [Minikube's storage support](https://minikube.sigs.k8s.io/docs/).
	- If you need to access services such as Jenkins or applications in Minikube externally, you may need to use port forwarding or set up a load balancer.

	That's it! Jenkins X should now be up and running on your Minikube cluster.