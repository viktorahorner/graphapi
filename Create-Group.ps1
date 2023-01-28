function Create-Group
{
param($displayname, $description)
$params = @"
{
	"description": "$description",
	"displayName": "$displayname",
	"groupTypes": [
"Security"
],
    "isAssignableToRole": true,
    "securityEnabled": true,
    "owners@odata.bind": [
        ""
    ],
    "members@odata.bind": [
        ""
    ]
}
"@
#New-MgGroup -BodyParameter $params

$graphApiVersion = "beta/"
$Resource = ("groups")
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method POST -Body $params -Verbose -ContentType application/json)
}
