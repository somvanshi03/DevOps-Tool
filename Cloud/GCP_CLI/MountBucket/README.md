## Add the Cloud Storage FUSE distribution URL as a package source:

	export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list

## Import the Google Cloud public key:

	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc


## Update the list of available packages and install Cloud Storage FUSE:


	sudo apt-get update
	sudo apt-get install gcsfuse
	
	
## Mount your storage bucket using the gcsfuse command:	

	gcsfuse BUCKET_NAME /mydata