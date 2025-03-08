# Install-DotNetCore8-MultipleServers.ps1

# List of remote servers
$servers = @(
    "Server1",
    "Server2",
    "Server3",
    "Server4",
    "Server5"
)

# Define the download URLs for .NET Core 8 SDK and runtimes
$dotnetRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/9c2068f2-dd3e-46cb-a88d-3c2d35b5181f/9ce26210851b0720c5382c6cd056b126/dotnet-runtime-8.0.13-win-x64.exe"
$aspnetCoreRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/86b8931f-09f6-4fce-b546-8139350da0c4/d6a5f16bcf81e0b5e9a733b892b1240f/aspnetcore-runtime-8.0.13-win-x64.exe"
$dotnetDesktopRuntimeUrl = "https://download.visualstudio.microsoft.com/download/pr/fc8c9dea-8180-4dad-bf1b-5f229cf47477/c3f0536639ab40f1470b6bad5e1b95b8/windowsdesktop-runtime-8.0.13-win-x64.exe"
$dotnetSdkUrl = "https://download.visualstudio.microsoft.com/download/pr/bd44cdb8-dcac-4f1f-8246-1ee392c68dac/ba818a6e513c305d4438c7da45c2b085/dotnet-sdk-8.0.406-win-x64.exe"


# Function to install .NET Core components on a remote server
function Install-DotNetCore {
    param (
        [string]$server
    )

    # Define the paths to save the installers
    $sdkInstallerPath = "C:\Temp\dotnet-sdk-8.0.xxx-win-x64.exe"
    $runtimeInstallerPath = "C:\Temp\dotnet-runtime-8.0.xxx-win-x64.exe"
    $aspnetInstallerPath = "C:\Temp\dotnet-aspnetcore-runtime-8.0.xxx-win-x64.exe"

    # Create a script block to run on the remote server
    $scriptBlock = {
        param (
            $sdkUrl,
            $runtimeUrl,
            $aspnetUrl,
            $sdkInstallerPath,
            $runtimeInstallerPath,
            $aspnetInstallerPath
        )

        # Function to download and install .NET components
        function Install-DotNetComponent {
            param (
                [string]$Url,
                [string]$InstallerPath
            )

            # Download the installer
            Write-Host "Downloading installer from $Url..."
            Invoke-WebRequest -Uri $Url -OutFile $InstallerPath

            # Install the component silently
            Write-Host "Installing $InstallerPath..."
            Start-Process -FilePath $InstallerPath -ArgumentList "/install", "/quiet", "/norestart" -Wait

            # Clean up the installer
            Remove-Item -Path $InstallerPath -Force
            Write-Host "Installation completed and installer cleaned up."
        }

        # Install .NET Core 8 SDK
        Install-DotNetComponent -Url $sdkUrl -InstallerPath $sdkInstallerPath

        # Install .NET Core 8 Runtime
        Install-DotNetComponent -Url $runtimeUrl -InstallerPath $runtimeInstallerPath

        # Install ASP.NET Core 8 Runtime
        Install-DotNetComponent -Url $aspnetUrl -InstallerPath $aspnetInstallerPath

        # Verify the installation
        Write-Host "Verifying .NET Core installation..."
        $dotnetVersion = & "$env:ProgramFiles\dotnet\dotnet.exe" --version
        if ($dotnetVersion) {
            Write-Host ".NET Core $dotnetVersion installed successfully."
        } else {
            Write-Host "Failed to verify .NET Core installation."
        }
    }

    # Invoke the command on the remote server
    Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock -ArgumentList $dotnetSdkUrl, $dotnetRuntimeUrl, $aspnetRuntimeUrl, $sdkInstallerPath, $runtimeInstallerPath, $aspnetInstallerPath
}

# Loop through each server and install .NET Core
foreach ($server in $servers) {
    Write-Host "Installing .NET Core on $server..."
    Install-DotNetCore -server $server
}