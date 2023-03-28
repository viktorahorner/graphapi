function Get-GroupByDisplayname
{
param ($displayname)
$graphApiVersion = "beta/"
$Resource = ("groups`?`$filter=displayName eq '$displayname'")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
return $MCCgroupsResponse.value
}
function Add-GroupMember
{
param($GroupDisplayname, $UserPrincipalname)
$graphApiVersion = "v1.0/"
$MCCuser = $UserPrincipalname
$Resource = ("users/")
$uri = 'https://graph.microsoft.com/'
$MCCusersResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource+$MCCuser) –Headers $authToken –Method Get -Verbose)
$MCCusersResponse.id

$params = @"
{
    "@odata.id": "https://graph.microsoft.com/v1.0/directoryObjects/$($MCCusersResponse.id)"
}
"@
$group = Get-GroupByDisplayname -displayname $GroupDisplayname
$graphApiVersion = "beta/"
$Resource = ("groups/`{"+$group[0].Id+"`}/members/`$ref")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method POST -Body $params -Verbose -ContentType application/json)
}
