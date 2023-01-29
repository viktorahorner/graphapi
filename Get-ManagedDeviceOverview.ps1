function Get-ManagedDeviceOverview
{
$graphApiVersion = "Beta"
$Resource = "deviceManagement/managedDeviceOverview"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCmanageddevices = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
$MCCmanageddevices.deviceOperatingSystemSummary
$MCCmanageddevices.deviceExchangeAccessStateSummary
Write-Host 'Amount of Enrolled devices :' -ForegroundColor Green
$MCCmanageddevices.enrolledDeviceCount
return $MCCmanageddevices
}
