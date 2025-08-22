# NOTE: this script uses the PSWindowsUpdate module!!

# Get all enabled computers in the domain
$computers = Get-Content -Path "C:\Users\Admin\Documents\scripts\computers.txt"

# Store results
$results = @()

foreach ($computer in $computers) {
    Write-Host "Checking $computer..." -ForegroundColor Cyan

    try {
        $status = Get-WURebootStatus -ComputerName $computer -ErrorAction Stop
        $results += $status
    } catch {
        $results += [PSCustomObject]@{
            ComputerName                = $computer
            RebootPending              = 'Error'
            CbsRebootPending           = 'Error'
            WindowsUpdateRebootRequired = 'Error'
        }
    }
}

# Display the results
$results | Format-Table -AutoSize

# Keep window open
Write-Host "`nPress Enter to exit..."
Read-Host
