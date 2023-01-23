function Export-AllUsers{
# Get all Users
$filepath = 'C:\temp\'
$graphApiVersion = "beta/"
$Resource = ('users?$top=999')
$uri = 'https://graph.microsoft.com/'
$MCCusersResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource) –Headers $authToken –Method Get -Verbose)

    $MCCusers = $MCCusersResponse.value

    $MCCusersNextLink = $MCCusersResponse."@odata.nextLink"

        while ($MCCusersNextLink -ne $null){

            $MCCusersResponse = (Invoke-RestMethod -Uri $MCCusersNextLink –Headers $authToken –Method Get -Verbose)
            $MCCusersNextLink = $MCCusersResponse."@odata.nextLink"
            $MCCusers += $MCCusersResponse.value

        }
$MCCusers | ConvertTo-Csv -Delimiter ';' | Out-File -FilePath ($filepath+'user_details.csv')
Write-Host $MCCusers.Count'  Users have been exported to '($filepath+'user_details.csv') -ForegroundColor Green
}
