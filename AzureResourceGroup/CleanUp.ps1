Set-Location "C:\Users\brettwil\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager

$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"

$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bdx3"
$Location = "East US 2"

Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force

Set-Location "C:\Users\brettwil\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager

$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$ErrorActionPreference = "Stop"

$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bdx4"
$Location = "East US 2"

Get-AzureResourceGroup -Name $ResourceGroupName | ft
Remove-AzureResourceGroup -Name $ResourceGroupName -Force