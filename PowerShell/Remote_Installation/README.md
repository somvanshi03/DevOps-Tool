# Install DotNetCore 8 on Windows Server from local machine (Remotly)

## Open PowerShell as Administrator

## TargetServer:

	1 Enable-PSRemoting -Force
	2 Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
	3 Set-Service -Name "FDResPub" -StartupType Automatic
	4 Start-Service -Name "FDResPub"
	5 Get-NetFirewallRule | Where-Object { $_.DisplayName -like "*File and Printer Sharing*" }
	6 New-NetFirewallRule -Name "Allow PowerShell Remoting" -DisplayName "Allow PowerShell Remoting" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5985
	7 New-NetFirewallRule -Name "Allow PowerShell Remoting HTTPS" -DisplayName "Allow PowerShell Remoting HTTPS" -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 5986
	
## Local Server:

	1 Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True
	2 Set-Service -Name "FDResPub" -StartupType Automatic
	3 Start-Service -Name "FDResPub"
	4 Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Concatenate -Force
	5 Get-Item WSMan:\localhost\Client\TrustedHosts
	6 Test-WSMan -ComputerName "TargetServer"
	7 cd .\Desktop\Script\
	8 .\Install.ps1