## Azure Monitoring Quotas Programatically

## Introduction
Some Azure services have adjustable quota limits. Monitoring these quota limits is critical for keeping mission-critical applications and services up and running. Using this script, you can monitor and auto create the quota limit increase cases for the critical quotas.

Important commands, required to run the script


## To register the resource provider, execute the below command
Register-AzResourceProvider -ProviderNamespace Microsoft.Compute

The result set looks like the following:
ProviderNamespace : Microsoft.Compute
RegistrationState : Registered
ResourceTypes     : {availabilitySets, virtualMachines,
                    virtualMachines/extensions,
                    virtualMachineScaleSets…}
Locations         : {East US, East US 2, West US, Central US…}

## Use the below command to get the object id

**The result set looks like the following:

![image](https://user-images.githubusercontent.com/78607937/122462770-fc44d680-cf82-11eb-85e9-1c53f6df354b.png)



## Use the below command to get the Subscription id, Tenant id

Get-Azsubscription -subscriptionName “subscriptionName”

**The result set looks like the following:

![image](https://user-images.githubusercontent.com/78607937/122463241-5e9dd700-cf83-11eb-95e0-2fd9afc1f683.png)

## The threshold limit value to trigger the case creation can be changed based on the business use case.

The custom script(.ps1) can be scheduled to execute from the task scheduler in windows or cron job in Linux.

If you have questions or suggestions, please leave your comments below. Good luck!
