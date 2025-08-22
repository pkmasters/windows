#Repair domain trust to security.local
Test-ComputerSecureChannel -Verbose -Repair -Credential DOMAIN\user

# Keep window open
Write-Host "`nPress Enter to exit..."
Read-Host

#Restart Computer
#Restart-Computer -Force
