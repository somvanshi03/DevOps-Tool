# Webserver on Amazonlinux


## Step 1: Update the System

	First, ensure your system is up to date.
	
	sudo yum update -y


## Step 2: Install Apache HTTP Server (`httpd`)
	
	Install the Apache HTTP Server.

	sudo yum install httpd -y


## Step 3: Start and Enable Apache

	Start the Apache service and enable it to start on boot.

	sudo systemctl start httpd
	sudo systemctl enable httpd


## Step 4: Open HTTP and HTTPS Ports in the Firewall

	Allow HTTP (port 80) and HTTPS (port 443) traffic through the firewall.


	sudo firewall-cmd --permanent --add-service=http
	sudo firewall-cmd --permanent --add-service=https
	sudo firewall-cmd --reload


## Step 5: Install `mod_ssl` and `openssl`

	Install the `mod_ssl` module and `openssl` to enable SSL support.


	sudo yum install mod_ssl openssl -y


## Step 6: Generate a Self-Signed SSL Certificate

	Generate a self-signed SSL certificate. You can replace `yourdomain.com` with your actual domain name.


	sudo mkdir /etc/httpd/ssl
	sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/httpd/ssl/app1.abc.com.key -out /etc/httpd/ssl/app1.abc.com.crt


	During the certificate generation process, you will be prompted to enter some information. You can fill in the details as per your requirement.

## Step 7: Configure Apache to Use SSL

	Edit the SSL configuration file for Apache.


	sudo vi /etc/httpd/conf.d/ssl.conf
	

	Locate the following lines and update them with the paths to your SSL certificate and key:

	<VirtualHost _default_:443>
		DocumentRoot "/var/www/html"
		ServerName yourdomain.com:443
		SSLEngine on
		SSLCertificateFile /etc/httpd/ssl/yourdomain.com.crt
		SSLCertificateKeyFile /etc/httpd/ssl/yourdomain.com.key
	</VirtualHost>


## Step 8: Restart Apache

	Restart the Apache service to apply the changes.

	
	sudo systemctl restart httpd
	

## Step 9: Verify the Setup

	You can now verify the setup by accessing your server via HTTPS in a web browser:

	http://app1.abc.com it will redirect to https://app1.abc.com
	

	If you used a self-signed certificate, your browser may warn you about the certificate being untrusted. You can proceed by accepting the risk.

## Step 10: (Optional) Redirect HTTP to HTTPS

	To ensure all traffic is encrypted, you can set up a redirect from HTTP to HTTPS. Edit the main Apache configuration file:

	sudo vi /etc/httpd/conf/httpd.conf
	

	Add the following lines at the end of the file:


	<VirtualHost *:80>
		ServerName yourdomain.com
		Redirect permanent / https://yourdomain.com/
	</VirtualHost>


	Restart Apache to apply the changes:

	
	sudo systemctl restart httpd
	

### Conclusion

	You have successfully set up Apache HTTP Server with SSL on Amazon Linux 2023. 
	Your website should now be accessible over HTTPS. If you are using a production environment, 
	consider obtaining a certificate from a trusted Certificate Authority (CA) instead of using a self-signed certificate.