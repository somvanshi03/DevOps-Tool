# To install CodeReady Containers (CRC) on Ubuntu, follow these steps:

## Step 1: Prepare Your System
	
	Ensure your system has the necessary virtualization support on Ubuntu: 
	A Developer's Guide](https://dev.to/khurammurad/how-to-set-up-openshift-local-crc-on-ubuntu-a-developers-guide-le2). 
	Open a terminal and run:


	sudo apt update
	sudo apt install -y qemu-kvm libvirt-daemon libvirt-daemon-system network-manager


## Step 2: Install Required Dependencies
	
	CRC needs certain packages to function properly on Ubuntu: A Developer's Guide](https://dev.to/khurammurad/how-to-set-up-openshift-local-crc-on-ubuntu-a-developers-guide-le2). 
	Install them using:


	sudo apt install -y virt-manager


## Step 3: Download and Install CRC
	
	Download the latest CRC from Red Hat's Developer portal on Ubuntu: A Developer's Guide](https://dev.to/khurammurad/how-to-set-up-openshift-local-crc-on-ubuntu-a-developers-guide-le2). 
	Extract the downloaded TAR archive and move the CRC executable to an appropriate place. 
	Make sure this place is covered by your `$PATH` variable.


	cd ~/Downloads
	tar xvf crc-linux-amd64.tar.xz
	mkdir -p ~/bin
	cp ~/Downloads/crc-linux-*-amd64/crc ~/bin


## Step 4: Setup and Start CRC
	
	Now you're ready to set up and start CRC:


	crc setup
	crc start


## Step 5: Log in to OpenShift
	
	Log in to your OpenShift cluster using the `oc login` command:


	oc login https://api.crc.testing:6443 -u kubeadmin -p <your_password>


	That's it! You should now have a local OpenShift cluster running on your Ubuntu machine. 
	If you encounter any issues, feel free to ask for more help!
