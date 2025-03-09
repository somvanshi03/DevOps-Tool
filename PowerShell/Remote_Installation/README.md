# Install DotNetCore 8 on Windows Server from local machine (Remotly)

## Open PowerShell as Administrator

## Enable PowerShell Remoting on Target Servers:

	Enable-PSRemoting -Force
	
## Configure the Firewall:

	New-NetFirewallRule:
	
	Allow HTTP traffic for WinRM:
	
	New-NetFirewallRule -DisplayName "Allow WinRM HTTP" -Direction Inbound -Protocol TCP -LocalPort 5985 -Action Allow -Profile Domain, Private

	Allow HTTPS traffic for WinRM:

	New-NetFirewallRule -DisplayName "Allow WinRM HTTPS" -Direction Inbound -Protocol TCP -LocalPort 5986 -Action Allow -Profile Domain, Private
	
	Verify the Rules:
	
	Get-NetFirewallRule -DisplayName "Allow WinRM HTTP", "Allow WinRM HTTPS"

### To allow the HTTP port, you can run:


	New-NetFirewallRule -Name "Allow PowerShell Remoting" -DisplayName "Allow PowerShell Remoting" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5985
	
### If you want to enable HTTPS, you can run:

	New-NetFirewallRule -Name "Allow PowerShell Remoting HTTPS" -DisplayName "Allow PowerShell Remoting HTTPS" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5986
	
## Set Trusted Hosts (if necessary) On Local Machine:

	Set-Item WSMan:\localhost\Client\TrustedHosts -Value "RemoteServerNameOrIP" -Concatenate -Force

	Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Concatenate -Force
	Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Concatenate -Force
	
	Get-Item WSMan:\localhost\Client\TrustedHosts
	
## Test the Connection: From your local machine

	Test-WSMan -ComputerName "RemoteServerNameOrIP
	ping dotnetserver
	
## now Execute VerifiyVersion.ps1 Script

	./VerifiyVersion.ps1
	
	Above script will copy Install-DotNetCore8.ps1 script from local to remote server and will start installation.