# Install Dotnet 8.0 on Ubuntu22.04

	wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
	sudo dpkg -i packages-microsoft-prod.deb
	sudo apt install apt-transport-https
	sudo apt-get update && sudo apt-get install -y dotnet-sdk-8.0
	sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-8.0
	dotnet --version