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
sudo apt update && sudo apt install vault -y 

```


### Verify Installation
Check that Vault is installed by verifying the version:
```
vault --version
```

## Commands:
```bash
Common commands:
    read        Read data and retrieves secrets
    write       Write data, configuration, and secrets
    delete      Delete secrets and configuration
    list        List data or secrets
    login       Authenticate locally
    agent       Start a Vault agent
    server      Start a Vault server
    status      Print seal and HA status
    unwrap      Unwrap a wrapped secret

Other commands:
    audit                Interact with audit devices
    auth                 Interact with auth methods
    debug                Runs the debug command
    events
    hcp
    kv                   Interact with Vault's Key-Value storage
    lease                Interact with leases
    monitor              Stream log messages from a Vault server
    namespace            Interact with namespaces
    operator             Perform operator-specific tasks
    patch                Patch data, configuration, and secrets
    path-help            Retrieve API help for paths
    pki                  Interact with Vault's PKI Secrets Engine
    plugin               Interact with Vault plugins and catalog
    policy               Interact with policies
    print                Prints runtime configurations
    proxy                Start a Vault Proxy
    secrets              Interact with secrets engines
    ssh                  Initiate an SSH session
    token                Interact with tokens
    transform            Interact with Vault's Transform Secrets Engine
    transit              Interact with Vault's Transit Secrets Engine
    version-history      Prints the version history of the target Vault server
```

## Start Vault in Dev mode
```bash
vault server -dev 

export VAULT_ADDR='http://127.0.0.1:8200'

vault login

vault list secrets
vault status

vault kv put secret/myapp/config username="admin" password="s3cr3tP@ss"

vault kv list secret/myapp

vault kv get secret/myapp/config
```