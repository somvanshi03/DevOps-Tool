# Install DotNetCore 8 on Windows Server from local machine (Remotly)

## Open PowerShell as Administrator

## TargetServer:

### Enable-PSRemoting

	Enable-PSRemoting -Force

### Allow File and Printer:

	Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
	Set-Service -Name "FDResPub" -StartupType Automatic
	Start-Service -Name "FDResPub"
	Get-NetFirewallRule | Where-Object { $_.DisplayName -like "*File and Printer Sharing*" }

### Allow Remoting in firewall:

	New-NetFirewallRule -Name "Allow PowerShell Remoting" -DisplayName "Allow PowerShell Remoting" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5985
	
	New-NetFirewallRule -Name "Allow PowerShell Remoting HTTPS" -DisplayName "Allow PowerShell Remoting HTTPS" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5986
	
## Local Server:

### Allow File and Printer:

	Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
	Set-Service -Name "FDResPub" -StartupType Automatic
	Start-Service -Name "FDResPub"
	Get-NetFirewallRule | Where-Object { $_.DisplayName -like "*File and Printer Sharing*" }

### Allow All client 

	Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Concatenate -Force
	Get-Item WSMan:\localhost\Client\TrustedHosts

### Test TargetServer connectivity:

	Test-WSMan -ComputerName "TargetServer"

### Execute Script to install package:

	cd .\Desktop\Script\
	.\Install.ps1