function Wipe-AndroidByUpn
{
param($Userprincipalname)
$Resource = ("deviceManagement/managedDevices`?`$filter=userprincipalname eq '$Userprincipalname' and operatingSystem eq 'android'")
$uri = 'https://graph.microsoft.com/'
$MCCdeviceResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
    $MCCdevice = $MCCdeviceResponse.value
    $data = @'
{
  "keepEnrollmentData": false,
  "keepUserData": false
}
'@
    $graphApiVersion = "beta/"
    $Resource = ("deviceManagement/managedDevices/$(($MCCdevice).Id)/microsoft.graph.wipe")
    (Invoke-RestMethod -Uri ("$($uri)$($graphApiVersion)$($Resource)`n$($data)") -ContentType application/json  –Headers $authToken –Method POST -Verbose)
}
