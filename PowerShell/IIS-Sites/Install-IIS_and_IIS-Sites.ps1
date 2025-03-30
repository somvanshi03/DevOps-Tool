# Install IIS with all features
Write-Host "Installing IIS with all features..."
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools

# Import the WebAdministration module
Import-Module WebAdministration

# Define the site name, physical path, and binding information
$siteName = "MySite"
$physicalPath = "C:\inetpub\wwwroot\MySite"
$httpBindingProtocol = "http"
$httpBindingAddress = "*"
$httpBindingPort = 80
$httpsBindingProtocol = "https"
$httpsBindingAddress = "*"
$httpsBindingPort = 443
$hostHeader = "mysite.example.com" # Replace with your domain
$certificateThumbprint = "YOUR_CERTIFICATE_THUMBPRINT" # Replace with your SSL certificate thumbprint

# Create the physical directory if it doesn't exist
if (-not (Test-Path $physicalPath)) {
    New-Item -ItemType Directory -Path $physicalPath
    Write-Host "Created directory: $physicalPath"
}

# Create the new site in IIS with the HTTP binding
Write-Host "Creating site '$siteName' with HTTP binding..."
New-Website -Name $siteName -PhysicalPath $physicalPath -BindingInformation "$httpBindingAddress:$httpBindingPort:$hostHeader" -Protocol $httpBindingProtocol

# Add the HTTPS binding to the site
Write-Host "Adding HTTPS binding to site '$siteName'..."
New-WebBinding -Name $siteName -Protocol $httpsBindingProtocol -Port $httpsBindingPort -HostHeader $hostHeader -IPAddress $httpsBindingAddress

# Add the SSL certificate to the HTTPS binding
Write-Host "Assigning SSL certificate to HTTPS binding..."
$binding = Get-WebBinding -Name $siteName -Protocol $httpsBindingProtocol -Port $httpsBindingPort
$binding.AddSslCertificate($certificateThumbprint, "My") # "My" refers to the local machine certificate store

# Verify the site was created
if (Get-Website -Name $siteName) {
    Write-Host "Site '$siteName' created successfully."
} else {
    Write-Host "Failed to create site '$siteName'."
}

# Optionally, start the site
Start-Website -Name $siteName
Write-Host "Site '$siteName' started."