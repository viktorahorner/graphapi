function Get-MobileAppConfigurations
{
$graphApiVersion = "Beta"
$Resource = "/deviceAppManagement/mobileAppConfigurations"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCmanageddevices = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
$MCCmanageddevices.value | select packageId, displayname
}
