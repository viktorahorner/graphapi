function Get-GroupMembers
{
param ($MCCgroup)
$graphApiVersion = "beta/"
$Resource = ("groups`?`$filter=displayName eq '$MCCgroup'")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
return $MCCgroupsResponse.value
}
