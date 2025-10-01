# Install the Elastic Agent:

### Prerequisites

- sudo (administrator) access on the Ubuntu 22.04 machine
- Supported architecture (e.g., x86_64/amd64)
- Outbound connectivity to Elastic endpoints if you’re enrolling agents to a remote Fleet server[1][2]

### Steps to Install Elastic Agent

1. **Download the Elastic Agent Package**

   Get the latest .deb package from Elastic’s official downloads:
   ```
	curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-9.1.4-amd64.deb
	sudo dpkg -i elastic-agent-9.1.4-amd64.deb
	or 
	curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-9.1.4-linux-x86_64.tar.gz
	tar xzvf elastic-agent-9.1.4-linux-x86_64.tar.gz
   ```
   Replace `<version>` with the version you need. Refer to the Elastic downloads page for available versions.[2][1]

2. **Install the Elastic Agent**

   ```
   sudo dpkg -i elastic-agent-9.1.4-amd64.deb
   ```

3. **Enroll (Optional: For Fleet-managed)**

   - Log in to your Kibana interface.
   - Navigate to "Fleet" under "Management" and click "Add agent".
   - Copy the enrollment command provided (it will include a token and fleet-server info).
   - Run the copied command on your Ubuntu system to enroll and start the agent managed by Fleet.[3]


4. Modify settings in the elastic-agent.yml as required.
```t 
# vi /etc/elasticsearch/elastic-agent.yml 
```
```yaml
[...]
outputs:
  default:
    type: elasticsearch
    hosts:
      - 'https://da4e3a6298c14a6683e6064ebfve9ace.us-central1.gcp.cloud.es.io:443'
    api_key: _Nj4oH0aWZVGqM7MGop8:349p_U1ERHyIc4Nm8_AYkw
[...]
```

5. **Start and Enable Elastic Agent**

   The Elastic Agent should be registered as a systemd service:
   ```
   sudo systemctl enable elastic-agent
   sudo systemctl start elastic-agent
   ```

6. **Verify the Installation**

   ```
   sudo systemctl status elastic-agent
   ```

   Or, for agent status:
   ```
   sudo elastic-agent status
   ```
  
7. Notes:
```
https://www.elastic.co/docs/reference/fleet/install-standalone-elastic-agent
https://www.devopsschool.com/blog/elastic-agent-installation-configuration/
```