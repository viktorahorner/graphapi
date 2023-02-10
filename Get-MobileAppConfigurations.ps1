function Get-MobileAppConfigurations
{
$graphApiVersion = "Beta"
$Resource = "/deviceAppManagement/mobileAppConfigurations"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCAppConfigurations = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
return $MCCAppConfigurations.value
}
