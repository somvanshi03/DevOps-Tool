### For Standalone Elastic Agent

1. **Create API Key in Kibana:**
   - Go to **Stack Management > API Keys** in Kibana.
   - Click “Create API key”.
   - Enter a name for the API key.
   - In the privileges section, use:

     ```json
     {
       "standalone_agent": {
         "cluster": [ "monitor" ],
         "indices": [
           {
             "names": [ "logs-*-*", "metrics-*-*", "traces-*-*", "synthetics-*-*" ],
             "privileges": [ "auto_configure", "create_doc" ]
           }
         ]
       }
     }
     ```
   - Adjust the indices according to the data your agent needs to write (remove "traces-*-*" and "synthetics-*-*" if not using those features).
   - Set an expiration if required.

2. **Copy API Key in Beats Format**:
   - After creation, select the “Beats” format (not Base64) and copy the `<id>:<key>` string.[1]

3. **Configure Agent with API Key**:
   - Add the API key to your `elastic-agent.yml` configuration under the `outputs` section as:
     ```yaml
     outputs:
       default:
         type: elasticsearch
         hosts: [ 'https://your-es-host:9200' ]
         api_key: <id>:<key>
     ```
   - Save and restart the agent.

***

### For Fleet-Managed Elastic Agent

1. **Create Fleet Enrollment Token (API Key):**
   - Navigate to **Fleet → Enrollment tokens** in Kibana.
   - Click “Create enrollment token”, name the token, and select the desired agent policy.[2][3]
   - Copy the token when shown (cannot be retrieved later).

2. **Enroll Agent Using the Token:**
   - Run the command provided in Kibana to enroll your agent:
     ```
     sudo elastic-agent enroll https://fleet-server-url:8220 <enrollment_token>
     ```
   - The elastic-agent will use the API key for secure communication (and output keys for ingesting data).

***

