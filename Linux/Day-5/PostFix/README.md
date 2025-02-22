# Install Postfix on Ubuntu:

## Install postfix

	sudo apt update
	sudo apt install postfix -y
	sudo dpkg-reconfigure postfix
	sudo apt install libsasl2-modules postfix

## Setup Password

	vi /etc/postfix/sasl_passwd

	[smtp.domain.com]:587 email_id:Password

## Setup mail 

	postmap /etc/postfix/sasl_passwd

## Set domain 

	vi /etc/postfix/main.cf
	relayhost = [SMTP.domain.com]:587
	#myhostname = ip-172-31-7-96.us-east-2.compute.internal

	smtp_sasl_auth_enable = yes
	smtp_sasl_security_options = noanonymous
	smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
	smtp_use_tls = yes
	smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

## Change permission

	sudo chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
	sudo chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

## Restart Postfix Services

	sudo systemctl restart postfix

## Setup network setting to check port no.

	apt install net-tools -y 
	netstat -tulpn | grep :25
	 
	echo "This is the email body." | mail -s "Email subject" user@domain.com

## Check Logs

	sudo tail -f /var/log/mail.log

	================================================================================

	sudo yum update -y
	sudo yum install postfix  -y
	sudo service postfix status
	sudo service postfix restart
	sudo yum install cyrus-sasl-plain -y

	vi /etc/postfix/sasl_passwd

	[smtppro.domain.com]:587 email_id:password

	postmap /etc/postfix/sasl_passwd

	vi /etc/postfix/main.cf
	relayhost = [smtppro.domain.com]:587
	myhostname = ip-172-31-7-96.us-east-2.compute.internal

	smtp_sasl_auth_enable = yes
	smtp_sasl_security_options = noanonymous
	smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
	smtp_use_tls = yes
	smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt

	sudo chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
	sudo chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

	sudo systemctl restart postfix

	yum install net-tools -y 
	netstat -tulpn | grep :25
	 
	echo "This is the email body." | mail -s "Email subject" user@domain.com
	tailf /var/log/maillog



	References:
	-----------

	https://oracle-base.com/articles/linux/configure-postfix-as-an-email-relay-on-oracle-linux-servers
	https://docs.oracle.com/en-us/iaas/Content/Email/Reference/postfix.htm
	https://docs.oracle.com/en/learn/oracle-linux-postfix-starttls/#generate-a-tls-certificate
	https://docs.oracle.com/en/learn/oracle-linux-postfix/#configure-postfix
	https://phoenixnap.com/kb/postfix-smtp  