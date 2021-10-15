// Main Bicep Script for Provisioning
targetScope = 'subscription'

//Params
@description('Specifies the environment of the deployment')
param environment string = 'dev'
@description('Specifies the location')
param location string = 'westeurope'
@description('Specifies the Prefix')
param prefix string = 'hackathon'
@description('Storage Location Of the Branch')
param locationBranch array
//@description('SQL Login')
//param sqlLogin string
//@description('SQL Pwd')
//param sqlPasswd string
//@description('Storage Location Of the Branch')
//param storageEndpointUrl string
//@description('Storage Location Of the Branch')
//param storageFs string


// Variables
var name = toLower('${prefix}-${environment}')


resource centralResourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = [for branch in locationBranch: {
  name :'${name}-${branch}'
  location:location
}]


module storageAccountCentralMgmt 'modules/storage.bicep' = [for branch in locationBranch: {
  name: '${name}-${branch}'
  scope : resourceGroup('${name}-${branch}')
  params: {
    storageName: branch
    location: location
    prefix: prefix
   }
}]


//module synapseWorkspaces 'modules/synapse.bicep' = [for branch in locationBranch: {
  name: '${name}-${branch}'
  scope : resourceGroup('${name}-${branch}')
  params: {
    synapseWsName: branch
    location: location
    prefix: prefix
    sqlLogin: sqlLogin
    sqlPasswd: sqlPasswd
    storageEndpointUrl: storageEndpointUrl
    storageFs: storageFs
   }

//}]
