# Set-Timestamps.ps1
# Description: Manually update file timestamps (Created, Modified, Accessed)

# Prompt for full file path
$filePath = Read-Host "Enter the full path of the file you want to edit (e.g., C:\HRConfidential\VPN_Credentials.txt)"

# Check if file exists
if (-Not (Test-Path $filePath)) {
    Write-Host "File not found. Please check the path." -ForegroundColor Red
    exit
}

# Prompt for date and time
$dateInput = Read-Host "Enter the date you want (e.g., 06/01/2022)"
$timeInput = Read-Host "Enter the time you want (e.g., 08:30 AM)"

# Combine date and time
try {
    $timestamp = Get-Date "$dateInput $timeInput"
} catch {
    Write-Host "Invalid date/time format. Please try again." -ForegroundColor Red
    exit
}

# Set the timestamps
$item = Get-Item $filePath
$item.CreationTime = $timestamp
$item.LastWriteTime = $timestamp
$item.LastAccessTime = $timestamp

Write-Host "Timestamps updated for '$filePath'" -ForegroundColor Green
Write-Host "New Timestamp: $($timestamp.ToString())"
