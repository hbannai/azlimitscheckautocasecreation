# azlimitscheckautocasecreation

**To register the resource provider, execute the below command.**
Register-AzResourceProvider -ProviderNamespace Microsoft.Compute

**The result set looks like the following:**
ProviderNamespace : Microsoft.Compute
RegistrationState : Registered
ResourceTypes     : {availabilitySets, virtualMachines,
                    virtualMachines/extensions,
                    virtualMachineScaleSets…}
Locations         : {East US, East US 2, West US, Central US…}

**Use the below command to get the Subscription id, Tenant id. **

Get-Azsubscription -subscriptionName “subscriptionName”

**The result set looks like the following:
**Name                Id                                   TenantId               State 
SubscriptionName 90e866b6-4211-41aa-9f87-fe3c974d5e17 74f988bf-89f1-45af-91ab-2d7cd011db47 Enabled

**The threshold limit value to trigger the case creation can be changed based on the business use case. **

The custom script(.ps1) can be scheduled to execute from the task scheduler in windows or cron job in Linux. 
