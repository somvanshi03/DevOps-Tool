# Define the remote server name or IP address
$remoteServer = "your-remote-server-name-or-ip"

# Define the path to the script on your local machine
$scriptPath = "C:\Users\Somvanshi\Desktop\Others\DevOps-Tool\PowerShell\DotnetCore_Installation\Install-DotNetCore8.ps1"

# Copy the script to the remote server
Copy-Item -Path $scriptPath -Destination "\\$remoteServer\C$\Temp\Install-DotNetCore8.ps1"

# Execute the script on the remote server
Invoke-Command -ComputerName $remoteServer -ScriptBlock {
    & "C:\Temp\Install-DotNetCore8.ps1"
}

## Verify Version
Invoke-Command -ComputerName $remoteServer -ScriptBlock {
    & "$env:ProgramFiles\dotnet\dotnet.exe" --version
}
