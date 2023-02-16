function Get-DeviceConfigurationAssignment
{
param($ConfigurationName)
$MCCdeviceprofiles = @()
$MCCconfigurations = Get-DeviceConfiguration -displayname $ConfigurationName
foreach($MCCconfiguration in $MCCconfigurations)
{
$graphApiVersion = "Beta"
$Resource = ("deviceManagement/deviceConfigurations/$($MCCconfiguration.id)/groupAssignments")
$uri = "https://graph.microsoft.com/$graphApiVersion/$($Resource)"
$MCCdeviceprofile = ((Invoke-RestMethod -Uri $uri -Header $authToken -Method GET -Verbose).value)
$object = New-Object -TypeName PSObject
            $object | Add-Member -MemberType Noteproperty -Name ConfigurationDisplayname $MCCconfiguration.displayname
            $object | Add-Member -MemberType Noteproperty -Name AssignmentID $MCCdeviceprofile.ID
            $object | Add-Member -MemberType Noteproperty -Name TargetGroupID $MCCdeviceprofile.TargetGroupID
            $object | Add-Member -MemberType Noteproperty -Name ExcludeGroup $MCCdeviceprofile.ExcludeGroup
$MCCdeviceprofiles += $object
}
return $MCCdeviceprofiles
}
