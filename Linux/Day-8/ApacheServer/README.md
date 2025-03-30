# Setup Apache server on Centos

## Step 1: Install `httpd` and `mod_ssl`

	sudo yum install httpd mod_ssl

## Step 2: Enable and Start `httpd`
	
	sudo systemctl enable httpd
	sudo systemctl start httpd

## Step 3: Create a Directory for the SSL Certificate

	sudo mkdir /etc/httpd/ssl

## Step 4: Generate a Self-Signed SSL Certificate

	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/httpd.key -out /etc/httpd/ssl/httpd.crt


	- `req`: This subcommand specifies that we want to use X.509 certificate signing request (CSR) management.
	- `-x509`: This option tells OpenSSL to create a self-signed certificate instead of generating a certificate signing request.
	- `-nodes`: This option tells OpenSSL to skip the option to secure the certificate with a passphrase.
	- `-days 365`: This option sets the length of time the certificate will be valid.
	- `-newkey rsa:2048`: This option creates a new certificate and a new key at the same time. The `rsa:2048` part tells OpenSSL to generate an RSA key that is 2048 bits long.
	- `-keyout`: This option specifies where to place the generated private key file.
	- `-out`: This option specifies where to place the generated certificate.

	You will be prompted to enter some information, such as Country Name, State or Province Name, Locality Name, Organization Name, Organizational Unit Name, Common Name (e.g., your FQDN or your domain name), and Email Address.

## Step 5: Configure `httpd` to Use the SSL Certificate

	sudo nano /etc/httpd/conf.d/ssl.conf

	SSLCertificateFile /etc/httpd/ssl/httpd.crt
	SSLCertificateKeyFile /etc/httpd/ssl/httpd.key


	Save and close the file.



## Step 6: Restart `httpd`

	sudo systemctl restart httpd

## Step 7: Test the Configuration

	Open your web browser and navigate to `https://your_server_ip_or_domain`. 
	You should see a warning about the self-signed certificate. You can proceed to the site by accepting the warning.

## Optional: Redirect HTTP to HTTPS
	If you want to redirect all HTTP traffic to HTTPS, you can modify the default HTTP configuration file.


	sudo nano /etc/httpd/conf/httpd.conf

	Add the following lines inside the `<VirtualHost *:80>` block:

	Redirect permanent / https://your_server_ip_or_domain/

	Save and close the file, then restart `httpd`.


	sudo systemctl restart httpd


## Step 8: Open Firewall Ports (if applicable)

	sudo firewall-cmd --permanent --add-service=http
	sudo firewall-cmd --permanent --add-service=https
	sudo firewall-cmd --reload


