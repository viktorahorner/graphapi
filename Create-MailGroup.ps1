function Create-MailGroup
{
param($displayname, $description)
$params = @"
{
  "description": "$description",
  "displayName": "$displayname",
  "groupTypes": [
  "Unified"
  ],
  "isAssignableToRole": false,
  "mailEnabled": true,
  "securityEnabled": false,
  "mailNickname": "$displayname"
}
"@

$graphApiVersion = "beta/"
$Resource = ("groups")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method POST -Body $params -Verbose -ContentType application/json)
}
