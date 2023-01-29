function Get-AllManagedDevices
{
$graphApiVersion = "beta/"
$Resource = ('deviceManagement/managedDevices')
$uri = 'https://graph.microsoft.com/'
$MCCdeviceResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)
    $MCCdevice = $MCCdeviceResponse.value
    $MCCdeviceNextLink = $MCCdeviceResponse."@odata.nextLink"
        while ($MCCdeviceNextLink -ne $null){
            $MCCdeviceResponse = (Invoke-RestMethod -Uri $MCCdeviceNextLink –Headers $authToken –Method Get -Verbose)
            $MCCdeviceNextLink = $MCCdeviceResponse."@odata.nextLink"
            $MCCdevice += $MCCdeviceResponse.value
        }
return $MCCdevice
}
