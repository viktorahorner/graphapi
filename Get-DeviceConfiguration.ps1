function Get-DeviceConfiguration
{
param($displayname)
$graphApiVersion = "Beta"
$MCCupn='Windows10'
$Resource = ("deviceManagement/deviceConfigurations`?`$filter=contains(displayName,'$displayname')")
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCdeviceprofiles = (Invoke-RestMethod -Uri $uri -Header $authToken -Method Get)
$MCCdeviceprofiles.value | select displayname,id
return $MCCdeviceprofiles.value
}
