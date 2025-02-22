# Setup mail Service on Centos/RHEL

## Install Required Package

	yum install procmail mailx sendmail sendmail-cf -y 

	cd /etc/mail

## smtp details, Email id and  Password

	vi /etc/mail/authinfo
	AuthInfo:smtp.domain.com "U:email_id" "P:password" "M:PLAIN"

## Change domain settings

	vi /etc/mail/sendmail.mc
	
	define(`SMART_HOST', `smtp.zoho.com')
	FEATURE(`authinfo')
	cd /etc/mail/

## Email Setup 

	m4 sendmail.mc >sendmail.cf
	makemap hash authinfo < authinfo

## Restart sendmail service
	
	systemctl restart sendmail 

## Send email from server

	sendmail abc@xyz.com 
	From: lmp@xyz.com
	Subject: Email subject
	This is the email body.

## Check logs

	tailf /var/log/maillog


	Note: Take a backup of /etc/services file. and change SMTP port from 25 to 587 for TCP and UDP and restart services.

## Install Required package

	yum install -y postfix mailx cyrus-sasl cyrus-sasl-plain

## Restart sendmail service

	systemctl restart sendmail