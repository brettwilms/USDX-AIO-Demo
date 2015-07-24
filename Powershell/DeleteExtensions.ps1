Param(
       [Parameter(Mandatory=$True,Position=1)]
       [string]$ResourceGroupName,
       [Parameter(Mandatory=$True,Position=2)]
       [string]$SubscriptionName
    )

$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"
cls
Switch-AzureMode -Name AzureResourceManager

Select-AzureSubscription -SubscriptionName $SubscriptionName
Select-AzureSubscription -SubscriptionName $SubscriptionName -Current
$vms = Get-AzureVM -ResourceGroupName $ResourceGroupName
foreach ($vm in $vms)
{
    if($vm.Extensions -ne $null)
    {    
        $arr = $vm.Extensions[0].Id.Split('/')
        $extensionName = $arr[$arr.Count-1]        
        Get-AzureVMExtension -ResourceGroupName $ResourceGroupName -VMName $vm.Name -Name $extensionName
        Remove-AzureVMExtension -ResourceGroupName $ResourceGroupName -VMName $vm.Name -Name $extensionName -Force
    }
}
