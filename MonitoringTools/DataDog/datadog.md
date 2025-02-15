# Install Datadog on Ubuntu, follow these steps:

## 1. Update your package list:
	
	Open a terminal and run the following command to update your system’s package list.
	
	sudo apt update


## 2. Install required dependencies:
	
	Install any required dependencies:

	sudo apt install -y apt-transport-https ca-certificates curl software-properties-common


## 3. Add the Datadog repository:
	
	Download and install the Datadog signing key:


	curl -sSL https://keys.datadoghq.com/DATADOG_APT_KEY.public | sudo tee /etc/apt/trusted.gpg.d/datadog.asc


	Now, add the Datadog repository to your system:


	echo "deb https://apt.datadoghq.com/ stable 7" | sudo tee /etc/apt/sources.list.d/datadog.list


## 4. Install the Datadog Agent:
	
	Update your package list again to include the Datadog repository:


	sudo apt update


## Now, install the Datadog agent:


	sudo apt install datadog-agent


## 5. Configure the Datadog Agent:
	
	You'll need to configure the agent with your Datadog API key. First, open the configuration file:

	sudo nano /etc/datadog-agent/datadog.yaml


## Find the `api_key` line in the configuration file and replace it with your Datadog API key:


	api_key: <YOUR_DATADOG_API_KEY>


	You can find your API key in your Datadog account under **Integrations > APIs**.

## 6. Start and enable the Datadog Agent:
	
	Enable and start the Datadog Agent to begin monitoring:


	sudo systemctl enable datadog-agent
	sudo systemctl start datadog-agent


## 7. Verify the installation:
	
	To ensure the agent is running properly, check the status of the Datadog Agent service:

	sudo systemctl status datadog-agent

	If everything is working, you should see the service as active.

## 8. Check the Datadog dashboard:
	
	After a few minutes, you can log in to your Datadog dashboard to view the metrics and logs from your Ubuntu machine.
