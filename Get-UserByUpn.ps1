function Get-UserByUpn
{
param($MMCUpn)
$graphApiVersion = "beta/"
$MCCuser = $MMCUpn
$Resource = ("users/")
$uri = 'https://graph.microsoft.com/'
$MCCusersResponse = (Invoke-RestMethod -Uri ($uri+$graphApiVersion+$Resource+$MCCuser) –Headers $authToken –Method Get -Verbose)
return $MCCusersResponse
}
