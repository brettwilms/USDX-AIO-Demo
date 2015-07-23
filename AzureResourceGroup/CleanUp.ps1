
Set-Location "C:\Users\brettwil\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager


$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"

$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bdx2"
$SubscriptionName = 'bwdx-demo'
$Location = "West US"


Select-AzureSubscription -SubscriptionName $SubscriptionName
Select-AzureSubscription -SubscriptionName $SubscriptionName -Current


<#
Get-AzureVMUsage -Location $Location
Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force


$vms = Get-AzureVM -ResourceGroupName $ResourceGroupName
foreach($vm in $vms)
{
    Remove-AzureVM -ResourceGroupName $ResourceGroupName -Name $vm.Name -Force
}
#>


