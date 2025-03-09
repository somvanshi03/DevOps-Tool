# Install-DotNetCore8.ps1

# Define the download URLs for .NET Core 8 components
$dotnetRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/9c2068f2-dd3e-46cb-a88d-3c2d35b5181f/9ce26210851b0720c5382c6cd056b126/dotnet-runtime-8.0.13-win-x64.exe"
$aspnetCoreRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/86b8931f-09f6-4fce-b546-8139350da0c4/d6a5f16bcf81e0b5e9a733b892b1240f/aspnetcore-runtime-8.0.13-win-x64.exe"
$dotnetDesktopRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/fc8c9dea-8180-4dad-bf1b-5f229cf47477/c3f0536639ab40f1470b6bad5e1b95b8/windowsdesktop-runtime-8.0.13-win-x64.exe"
$dotnetSdkUrl = "https://download.visualstudio.microsoft.com/download/pr/bd44cdb8-dcac-4f1f-8246-1ee392c68dac/ba818a6e513c305d4438c7da45c2b085/dotnet-sdk-8.0.406-win-x64.exe"

# Define the paths to save the installers
$runtimeInstallerPath = "$env:TEMP\dotnet-runtime-8.0.xxx-win-x64.exe"
$aspnetCoreRuntimeInstallerPath = "$env:TEMP\aspnetcore-runtime-8.0.xxx-win-x64.exe"
$desktopRuntimeInstallerPath = "$env:TEMP\dotnet-desktop-runtime-8.0.xxx-win-x64.exe"
$sdkInstallerPath = "$env:TEMP\dotnet-sdk-8.0.xxx-win-x64.exe"

# Download the .NET Core 8 Runtime installer
Invoke-WebRequest -Uri $dotnetRuntimeUrl -OutFile $runtimeInstallerPath

# Download the ASP.NET Core Runtime installer
Invoke-WebRequest -Uri $aspnetCoreRuntimeUrl -OutFile $aspnetCoreRuntimeInstallerPath

# Download the .NET Desktop Runtime installer
Invoke-WebRequest -Uri $dotnetDesktopRuntimeUrl -OutFile $desktopRuntimeInstallerPath

# Download the .NET Core 8 SDK installer
Invoke-WebRequest -Uri $dotnetSdkUrl -OutFile $sdkInstallerPath

# Install .NET Core 8 Runtime silently
Start-Process -FilePath $runtimeInstallerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait

# Install ASP.NET Core Runtime silently
Start-Process -FilePath $aspnetCoreRuntimeInstallerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait

# Install .NET Desktop Runtime silently
Start-Process -FilePath $desktopRuntimeInstallerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait

# Install .NET Core 8 SDK silently
Start-Process -FilePath $sdkInstallerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait

# Clean up the installers
Remove-Item -Path $runtimeInstallerPath -Force
Remove-Item -Path $aspnetCoreRuntimeInstallerPath -Force
Remove-Item -Path $desktopRuntimeInstallerPath -Force
Remove-Item -Path $sdkInstallerPath -Force

# Verify the installation
$dotnetVersion = & "$env:ProgramFiles\dotnet\dotnet.exe" --version
Write-Host ".NET Core $dotnetVersion installed successfully."