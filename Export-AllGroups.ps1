function Export-AllGroups
{
$MCCgroups = @()
$filepath = 'C:\temp\'
$graphApiVersion = "beta/"
$Resource = ('groups?$top=999')
$uri = 'https://graph.microsoft.com/'
$MCCgroupsResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)

    $MCCgroups = $MCCgroupsResponse.value

    $MCCgroupsNextLink = $MCCgroupsResponse."@odata.nextLink"

        while ($MCCgroupsNextLink -ne $null){

            $MCCgroupsResponse = (Invoke-RestMethod -Uri $MCCgroupsNextLink –Headers $authToken –Method Get -Verbose)
            $MCCgroupsNextLink = $MCCgroupsResponse."@odata.nextLink"
            $MCCgroups += $MCCgroupsResponse.value

        }
$MCCgroups | select displayname
$MCCgroups | ConvertTo-Csv -Delimiter ';' | Out-File -FilePath ($filepath+'\groups_details.csv')
Write-Host $MCCgroups.Count+'all group details have been exported to '($filepath+'groups_details.csv') -ForegroundColor Green
Return $MCCgroups
}
