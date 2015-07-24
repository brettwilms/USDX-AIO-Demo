Param(
       [Parameter(Mandatory=$True,Position=1)]
       [string]$ResourceGroupName,
       [Parameter(Mandatory=$True,Position=2)]
       [string]$SubscriptionName
    )

$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"
Switch-AzureMode -Name AzureResourceManager

Select-AzureSubscription -SubscriptionName $SubscriptionName
Select-AzureSubscription -SubscriptionName $SubscriptionName -Current
Remove-AzureResourceGroup -Name $ResourceGroupName -Force

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


