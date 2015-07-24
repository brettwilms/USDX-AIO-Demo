# Create a demo environment for USDX

This template will create a demo environment for USDX:

+	A Virtual Network
+	Several Storage Accounts
+	A vNet in the resource groups location with the following subnets:
	+	Presentation
	+	Application
	+	Data
	+	Secure
+	One external and one internal load balancer.
+	Two Domain Controllers in an availability set.
+	Three VMs in a Windows Server Cluster:
	+ 	Two VMs run SQL Server 2014 with an availability group
	+	The third is a File Share Witness for the Cluster
	+	The SQL availability group is configured with 3 fault domains and 3 update domains

The external load balancer includes
+	Two RDP NAT rules to allow connectivity to the two domain controllers (port 50001 and 50002).

A SQL Server always on listener is created using the internal load balancer with the recommended configuration.

# Known Issues

This template is largely serial due to some issues between the platform agent and the DSC extension which cause problems when multiple VM and\or extension resources are deployed concurrently. 
This issue will be fixed as soon as possible.

## Notes

+ 	The images used to create this deployment are
	+ 	AD - Latest Windows Server 2012 R2 Image
	+ 	SQL Server - Latest SQL Server 2014 on Windows Server 2012 R2 Image
	+ 	SQL Witness - Latest Windows Server 2012 R2 Image

+ 	The image configuration is defined in variables - details below - but the scripts that configure this deployment have only been tested with these versions and may not work on other images.

Click the button below to deploy from the portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fbrettwilms%2FUSDX-AIO-Demo%2Fmaster%2FARM-SQL-2014-AlwaysOn%2Fazuredeploy.json" target="_blank">
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
|AssetLocation|The location of resources that the script is dependent on such as linked templates and DSC modules|
|AdminUserName|The name of the Administrator of the new VMs and Domain|
|AdminPassword|The password for the Administrator account of the new VMs and Domain|
|DataDiskSizeGB|The size of the data disks to create - Useful when using premium storage|
|DomainDNS|The DNS name of the domain to create|
|DomainNetBIOS|DomainNetBIOS|
|ExternalDnsPrefix|The external DNS prefix for the solution - will be prefixed to 'cloudapp.net'|
|Namespace|The namespace of the solution|
|StorageAccountType|The type of the Storage Account created <ul>**Allowed Values**<li>Standard_LRS **(default)**</li><li>Standard_GRS</li><li>Standard_RAGRS</li><li>Premium_LRS</li>|


## Notable Variables

|Name|Description|
|:---|:---------------------|
|TBD|TBD|
|TBD|TBD|
|TBD|TBD|
|TBD|TBD|



