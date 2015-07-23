$rg = 'bdx2'

cls
$vms = Get-AzureVM -ResourceGroupName $rg
foreach ($vm in $vms)
{
    if($vm.Extensions -ne $null)
    {    
        $arr = $vm.Extensions[0].Id.Split('/')
        $extensionName = $arr[$arr.Count-1]        
        Get-AzureVMExtension -ResourceGroupName $rg -VMName $vm.Name -Name $extensionName
        Remove-AzureVMExtension -ResourceGroupName $rg -VMName $vm.Name -Name $extensionName -Force
    }
}


<#
(Get-AzureVM -ResourceGroupName bdx1 -VMName SQL1).Extensions

Get-AzureVMExtension -ResourceGroupName bdx1 -VMName SQL1 -Name sqlAOPrepare

Remove-AzureVMExtension -ResourceGroupName bdx1 -VMName SQL1 -Name sqlAOPrepare



(Get-AzureVM -ResourceGroupName bdx1 -VMName SQL2).Extensions

Get-AzureVMExtension -ResourceGroupName bdx1 -VMName SQL2 -Name CreateCluster

Remove-AzureVMExtension -ResourceGroupName bdx1 -VMName SQL2 -Name CreateCluster
#>