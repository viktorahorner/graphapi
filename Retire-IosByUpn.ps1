function Retire-IosByUpn
{
param($Userprincipalname)
$Resource = ("deviceManagement/managedDevices`?`$filter=userprincipalname eq '$Userprincipalname' and operatingSystem eq 'ios'")
$uri = 'https://graph.microsoft.com/'
$MCCdeviceResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
$MCCdevice = $MCCdeviceResponse.value
foreach ($MMCdev in $MCCdevice)
{
    $graphApiVersion = "beta/"
    $Resource = ("deviceManagement/managedDevices/$(($MCCdevice).Id)/retire")
    (Invoke-RestMethod -Uri ("$($uri)$($graphApiVersion)$($Resource)") –Headers $authToken –Method POST -Verbose)
}
}
