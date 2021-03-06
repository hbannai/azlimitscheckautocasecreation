Connect-AzAccount
Select-AzSubscription -Subscription "subscription name"

#command to register the resource providers
Register-AzResourceProvider -ProviderNamespace Microsoft.Capacity
get-AzResourceProvider -ProviderNamespace Microsoft.Capacity


#required information
$subscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
$pwd = "password"
$azureAdApplication = Get-AzADApplication -Objectid xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx
$subscription = Get-AzSubscription -SubscriptionId $subscriptionId
$clientId = $azureAdApplication.ApplicationId.Guid
$tenantId = $subscription.TenantId

#getting azure ad access token
$Uri = "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token";
$Body = @{
grant_type = "client_credentials"
client_id = $clientId
client_secret = $pwd
scope = 'https://management.azure.com/.default'
redirect_uri = 'https://localhost/'
}

$authResult = Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/x-www-form-urlencoded" -Body $body
$accessToken = $authResult.access_token
$authHeader = @{'Authorization'="Bearer $accessToken"}


#Command to list the limits
$request = "https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Capacity/resourceProviders/Microsoft.Compute/locations/westus2/serviceLimits/cores?api-version=2020-10-25"
$result = Invoke-RestMethod -Uri $request `
                        -ContentType application/json `
                            -Headers $authHeader `
                            -Method Get

$percentagelimitusage =  $result.properties.currentvalue/$result.properties.limit

If ($percentagelimitusage -ge 0.70)
 {

$requestlimitincrease = "New-AzSupportTicket -Name "Limit Increase" -Title "Capacity Limit increase" -Description "Requesting Limit Increase" -Severity "minimal" -ProblemClassificationId "/providers/Microsoft.Support/services/{billing_service_guid}/problemClassifications/{problemClassification_guid}" -CustomerContactDetail @{FirstName = "Harish" ; LastName = "B" ; PreferredTimeZone = "pacific standard time" ; PreferredSupportLanguage = "en-us" ; Country = "USA" ; PreferredContactMethod = "Email" ; PrimaryEmailAddress = "user@contoso.com"}"
$$requestlimitincrease.SupportTicketId
}

else
 {write-output " Limits are within the threshold limits!!!"}

}
