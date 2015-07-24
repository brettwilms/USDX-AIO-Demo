Param(
       [Parameter(Mandatory=$True,Position=1)]
       [string]$templateFile,
       [Parameter(Mandatory=$True,Position=2)]
       [string]$ResourceGroupName,
       [Parameter(Mandatory=$True,Position=3)]
       [string]$SubscriptionName,
       [Parameter(Position=4)]
       [string]$Location = "West US"
    )


Switch-AzureMode -Name AzureResourceManager
$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"

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

Pause
New-AzureResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $templateFile -TemplateParameterObject $params

<#
Get-AzureVMUsage -Location $Location
Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force
#>