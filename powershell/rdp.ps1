# Prompt for hostname only
$hostname = Read-Host "Enter the hostname (no FQDN)"

# Define your domain suffix
$domainSuffix = ".domain.local"

# Build the FQDN
$fqdn = "$hostname$domainSuffix"

# Define your RDP username (will appear in login window)
$username = "user@domain.local"

# Create a temporary .rdp file
$tempRdp = "$env:TEMP\ps_rdp.rdp"

@"
full address:s:$fqdn
username:s:$username
screen mode id:i:2
use multimon:i:0
session bpp:i:32
winposstr:s:0,1,221,0,1657,1040
compression:i:1
keyboardhook:i:2
audiocapturemode:i:0
videoplaybackmode:i:1
connection type:i:7
networkautodetect:i:1
bandwidthautodetect:i:1
displayconnectionbar:i:1
enableworkspacereconnect:i:0
disable wallpaper:i:0
allow font smoothing:i:0
allow desktop composition:i:0
disable full window drag:i:1
disable menu anims:i:1
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenable:i:1
audiomode:i:0
redirectprinters:i:1
redirectcomports:i:0
redirectsmartcards:i:1
redirectwebauthn:i:1
redirectclipboard:i:1
redirectposdevices:i:0
autoreconnection enabled:i:1
authentication level:i:2
prompt for credentials:i:1
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewayhostname:s:
gatewayusagemethod:i:4
gatewaycredentialssource:i:4
gatewayprofileusagemethod:i:0
promptcredentialonce:i:0
gatewaybrokeringtype:i:0
use redirection server name:i:0
rdgiskdcproxy:i:0
kdcproxyname:s:
enablerdsaadauth:i:0
"@ | Set-Content $tempRdp

# Launch RDP and wait for the process to start
Start-Process mstsc -ArgumentList $tempRdp

# Small delay to ensure mstsc has read the file
Start-Sleep -Seconds 2

# Delete the temp file
Remove-Item $tempRdp -Force -ErrorAction SilentlyContinue
