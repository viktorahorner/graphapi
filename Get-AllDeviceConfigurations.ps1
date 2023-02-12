function Get-AllDeviceConfigurations
{
$graphApiVersion = "Beta"
$Resource = "deviceManagement/deviceConfigurations"
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCdeviceprofiles = (Invoke-RestMethod -Uri $uri -Header $authToken -Method Get)
$MCCdeviceprofiles.value | select displayname,id
return $MCCdeviceprofiles.value
}
