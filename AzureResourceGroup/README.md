# Create a demo environment for USDX

This template will create a demo environment for USDX:

+	A Virtual Network
+	Six Storage Accounts
+	One external and one internal load balancer
+	Two VMs configured as Domain Controllers for a new forest with a single domain
+	Three VMs in a Windows Server Cluster, two VMs run SQL Server 2014 with an availability group and the third is a File Share Witness for the Cluster
+	Two Availability Sets one for the AD VMs, the other for the SQL and Witness VMs, the second Availability Set is configured with three Update Domains and three Fault Domains

The external load balancer creates an RDP NAT rule to allow connectivity to the first VM created, in order to access other VMs in the deployment this VM should be used as a jumpbox.

A SQL Server always on listener is created using the internal load balancer.

# Known Issues

This template is entirely serial due to some issues between the platform agent and the DSC extension which cause problems when multiple VM and\or extension resources are deployed concurrently. This issue will be fixed as soon as possible.

## Notes

+ 	The images used to create this deployment are
	+ 	AD - Latest Windows Server 2012 R2 Image
	+ 	SQL Server - Latest SQL Server 2014 on Windows Server 2012 R2 Image
	+ 	Witness - Latest Windows Server 2012 R2 Image

+ 	The image configuration is defined in variables - details below - but the scripts that configure this deployment have only been tested with these versions and may not work on other images.


Click the button below to deploy from the portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrettwilms%2FUSDX-AIO-Demo%2Fmaster%2FAzureResourceGroup%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


## Deploying from PowerShell 

For details on how to install and configure Azure Powershell see [here].(https://azure.microsoft.com/en-us/documentation/articles/powershell-install-configure/)

Launch a PowerShell console

Ensure that you are in Resource Manager Mode

```PowerShell

Switch-AzureMode AzureResourceManager

```
Change working folder to the folder containing this template

```PowerShell

New-AzureResourceGroup -Name "<new resourcegroup name>" -Location "<new resourcegroup location>"  -TemplateParameterFile .\azuredeploy-parameters.json -TemplateFile .\azuredeploy.json

```

## Parameters

|Name|Description                                        |
|:----|:-------------------------------------------------|
|Namespace|The namespace for the solution|
|location|Location where to deploy the resource <ul>**Allowed Values**<li>West US **(default)**</li><li>East US</li><li>West Europe</li><li>East Asia</li><li>Southeast Asia</li>|


## Notable Variables

|Name|Description|
|:---|:---------------------|
|virtualNetworkName|Name of the Virtual Network|
|rdpPort|The public RDP port for first VM|
|windowsImagePublisher|The name of the pulisher of the AD and Witness Image|
|windowsImageOffer|The Offer Name for the Image used by AD and Witness VMs|
|windowsImageSKU|The Image SKU for the AD and Witness Image|
|sqlImagePublisher|The name of the pulisher of the SQL Image|
|sqlImageOffer|The Offer Name for the Image used by SQL|
|sqlImageSKU|The Image SKU for the SQL Image|
|domainName|The name of the new AD Domain created|




