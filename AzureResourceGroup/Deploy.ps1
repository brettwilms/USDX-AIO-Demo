Set-Location "C:\Users\brettwil\Documents\GitHub\USDX-AIO-Demo\AzureResourceGroup"
Switch-AzureMode -Name AzureResourceManager

$VerbosePreference = "Continue"                     # set to SilentlyContinue to suppress output
$templateFile = '.\azuredeploy.json'
$ResourceGroupName = "bwdx1"
New-AzureResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile $templateFile