Set-Location "C:\Users\brett\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager


$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"

$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bdx3"
$SubscriptionName = 'bwdx-demo'
$Location = "East US 2"


Select-AzureSubscription -SubscriptionName $SubscriptionName
Select-AzureSubscription -SubscriptionName $SubscriptionName -Current

write-verbose "Gathering credentials"
if ($null -eq $CredentialsToSetInsideVM)
{
    [PSCredential]$CredentialsToSetInsideVM = Get-Credential -Message "Set the local administrator account credentials for the VM" -UserName "LocalAdmin"
}

$rg = $null
$rg = Get-AzureResourceGroup -Name $ResourceGroupName -ErrorAction SilentlyContinue
if($null -eq $rg)
{
    New-AzureResourceGroup -Name $ResourceGroupName -Location $location
}

$params = @{adminUserName=$CredentialsToSetInsideVM.UserName;adminPassword=$CredentialsToSetInsideVM.GetNetworkCredential().Password}
New-AzureResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $templateFile -TemplateParameterObject $params

<#

Get-AzureVMUsage -Location $Location
Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force

#>