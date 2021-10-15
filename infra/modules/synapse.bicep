targetScope = 'resourceGroup'


@description('Synapse Name')
param synapseWsName string 
@description('Identity type')
param identityType string
@description('Specifies the Location')
param location string = 'hackathon'
@description('Specifies the Storage Endpoint')
param storageEndpointUrl string = 'hackathon'
@description('Specifies the Storage File System')
param storageFs string = 'hackathon'
@description('Specifies the Storage File System')
param sqlLogin string = 'hackathon'
@description('Specifies the Storage File System')
param sqlPasswd string = 'hackathon'


resource synapseWorkspace 'Microsoft.Synapse/workspaces@2021-05-01' = {
  name: synapseWsName
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
