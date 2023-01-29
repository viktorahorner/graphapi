function Create-Group
{
param($displayname, $description)
$params = @"
{
  "description": "$description",
  "displayName": "$displayname",
  "groupTypes": [
  ],
  "isAssignableToRole": false,
  "mailEnabled": false,
  "securityEnabled": true,
  "mailNickname": "$displayname"
}
"@

$graphApiVersion = "beta/"
$Resource = ("groups")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method POST -Body $params -Verbose -ContentType application/json)
}
