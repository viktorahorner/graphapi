function Get-AllAppPolicies
{
$graphApiVersion = "Beta"
$Resource = "/deviceAppManagement/managedAppPolicies"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCapppolicies = (Invoke-RestMethod -Uri $uri -Headers $authToken -Method Get)
$MCCapppolicies.value | select packageId, displayname
return $MCCapppolicies.value
}
