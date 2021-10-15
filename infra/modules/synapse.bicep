targetScope = 'resourceGroup'


@description('Synapse Name')
param synapseWsName string 
@description('Identity type')
param identityType string = 'SystemAssigned'
@description('Specifies the Location')
param location string = 'westeurope'
@description('Specifies the Storage Endpoint')
param storageEndpointUrl string
@description('Specifies the Storage File System')
param storageFs string 
@description('Specifies the Storage File System')
param sqlLogin string 
@description('Specifies the Storage File System')
param sqlPasswd string 
@description('Specifies the Prefix')
param prefix string = 'hackathon'

// Define Vars
var name = toLower('syn${prefix}${synapseWsName}')


resource synapseWorkspace 'Microsoft.Synapse/workspaces@2021-05-01' = {
  name: name
  location: location
  identity: {
    type: identityType
  }
  properties: {

    defaultDataLakeStorage: {
      accountUrl: storageEndpointUrl
      filesystem: storageFs
    }
    publicNetworkAccess: 'Enabled'
    sqlAdministratorLogin: sqlLogin
    sqlAdministratorLoginPassword: sqlPasswd
  }
}

//allowAll TODO : Private Link Setup
resource firewallRules 'Microsoft.Synapse/workspaces/firewallRules@2021-06-01-preview' = {
  name: 'allowAll'
  parent: synapseWorkspace
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '255.255.255.255'
  }
}
