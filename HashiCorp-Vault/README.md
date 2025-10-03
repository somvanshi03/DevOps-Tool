# Install Hashicorp on Ubuntu


### Update Your System
Start by updating your local package index:
```
sudo apt update
```


### Add HashiCorp’s GPG Key
Download and add the HashiCorp GPG key to verify package authenticity:
```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```


### Add the HashiCorp Repository
Add the HashiCorp repository to your system’s package sources:
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```


### Install Vault
Update apt again and install Vault:
```
sudo apt update
sudo apt install vault
```


### Verify Installation
Check that Vault is installed by verifying the version:
```
vault --version
```
