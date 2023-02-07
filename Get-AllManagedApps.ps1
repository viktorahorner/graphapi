function Get-AllManagedApps
{
$graphApiVersion = "Beta"
$Resource = "/deviceAppManagement/mobileApps"

$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCmobileApps = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
}
