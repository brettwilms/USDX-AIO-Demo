
Set-Location "C:\Users\brettwil\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager


$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Continue"

$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bdx3"
$SubscriptionName = 'bwdx-demo'
$Location = "West US"


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

$params = @{adminUserName=$CredentialsToSetInsideVM.UserName;adminPassword=$CredentialsToSetInsideVM.GetNetworkCredential().Password;StorageAccountType="Premium_LRS";DataDiskSizeGB=127}

#Pause
New-AzureResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $templateFile -TemplateParameterObject $params

<#
Get-AzureVMUsage -Location $Location
Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force
#>