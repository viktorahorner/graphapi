function Wipe-AndroidByUpn
{
param($Userprincipalname)
$graphApiVersion = "beta/"
$Resource = ("deviceManagement/managedDevices`?`$filter=userprincipalname eq '$Userprincipalname' and operatingSystem eq 'android'")
$uri = 'https://graph.microsoft.com/'
(Invoke-RestMethod -Uri ("$($uri)$($graphApiVersion)$($Resource)") –Headers $authToken –Method POST -Body $data -ContentType "application/json" -Verbose)  
}
