function Get-DeviceByUpn
{
param($userprincipalname)
$graphApiVersion = "beta/"
$Resource = ("deviceManagement/managedDevices`?`$filter=userprincipalname eq '$userprincipalname'")
$uri = 'https://graph.microsoft.com/'
$MCCdeviceResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
    $MCCdevice = $MCCdeviceResponse.value
foreach($deviceinfo in $MCCdevice)
{
$deviceinfo.Userprincipalname+' '+$deviceinfo.serialnumber+' '+$deviceinfo.devicename+' '+$deviceinfo.joinType
}
}
