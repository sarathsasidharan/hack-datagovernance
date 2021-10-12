// Main Bicep Script for Provisioning
targetScope = 'subscription'

//Params
@description('Specifies the environment of the deployment')
param environment string = 'dev'
@description('Specifies the location')
param location string = 'dev'
@description('Specifies the location')
param prefix string = 'hackathon'


// Variables
var name = toLower('${prefix}-${environment}')

resource centralMgmtResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name :'${name}-mgmt'
  location:location
}

resource usResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name :'${name}-us'
  location:location
}

resource euResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name :'${name}-eu'
  location:location
}

resource meaResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name :'${name}-mea'
  location:location
}

resource saMgmtResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name :'${name}-sa'
  location:location
}
