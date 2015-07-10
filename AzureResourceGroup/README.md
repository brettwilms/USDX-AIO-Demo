# Create a demo environment for USDX

This template will create a demo environment for USDX:

+	A Virtual Network
+	Six Storage Accounts
+	One external and one internal load balancer
+	Two Domain Controllers in an availability set.
+	Three VMs in a Windows Server Cluster, two VMs run SQL Server 2014 with an availability group and the third is a File Share Witness for the Cluster
+	A number of load balanced web servers in an availability set
+	A number of load Remote Desktop gateway servers in an availability set
+	A number of Remote Desktop Session Host servers in an availability set

The external load balancer includes
+	Two RDP NAT rules to allow connectivity to the two domain controllers (port 50001 and 50002).
+	An Inbound load balanced rule on tcp port 80 to the web servers with client affinity = none and an HTTP probe to /
+	An Inbound load balanced rule on tcp port 443 to the Remote Desktop Gateway servers with client affinity = SourceIP and a TCP probe to port 443
+	An Inbound load balanced rule on udp port 3391 to the Remote Desktop Gateway servers with client affinity = SourceIP and a TCP probe to port 443

A SQL Server always on listener is created using the internal load balancer with the recommended configuration.

# Known Issues

This template is largely serial due to some issues between the platform agent and the DSC extension which cause problems when multiple VM and\or extension resources are deployed concurrently. 
This issue will be fixed as soon as possible.

## Notes

+ 	The images used to create this deployment are
	+ 	AD - Latest Windows Server 2012 R2 Image
	+ 	RD Gateway - Latest Windows Server 2012 R2 Image
	+ 	RD Session Host - Latest Windows Server 2012 R2 Image
	+ 	SQL Server - Latest SQL Server 2014 on Windows Server 2012 R2 Image
	+ 	SQL Witness - Latest Windows Server 2012 R2 Image
	+ 	Web - Latest Windows Server 2012 R2 Image

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
|DnsPrefix|The DNS prefix for the public IP of the solution - Defaults to the resource group name|
|Namespace|The namespace for the solution - Defaults to the resource group name|
|location|Location where to deploy the resource <ul>**Allowed Values**<li>West US</li><li>East US **(default)**</li><li>West Europe</li><li>East Asia</li><li>Southeast Asia</li>|


## Notable Variables

|Name|Description|
|:---|:---------------------|
|TBD|TBD|
|TBD|TBD|
|TBD|TBD|
|TBD|TBD|



