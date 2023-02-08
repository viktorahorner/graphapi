function Get-AllAppRegistrations
{
$graphApiVersion = "Beta"
$Resource = "/deviceAppManagement/managedAppRegistrations"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCappregistrations = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
$MCCappregistrations.value | select packageId, displayname
return $MCCappregistrations.value
}
