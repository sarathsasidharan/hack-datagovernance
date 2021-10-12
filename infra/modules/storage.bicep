targetScope = 'resourceGroup'

@description('Storage Name')
param storageName string 
param location string

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01'= {
  name: storageName
  location: location
  sku: {
    name: 'Standard_ZRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
      accessTier: 'Hot'
      allowBlobPublicAccess: false
      allowSharedKeyAccess: false
      encryption: {
        keySource: 'Microsoft.Storage'
        requireInfrastructureEncryption: false
        services: {
          blob: {
            enabled: true
            keyType: 'Account'
          }
          file: {
            enabled: true
            keyType: 'Account'
          }
          queue: {
            enabled: true
            keyType: 'Service'
          }
          table: {
            enabled: true
            keyType: 'Service'
          }
        }
      }
      isHnsEnabled: true
      isNfsV3Enabled: false
      largeFileSharesState: 'Disabled'
      minimumTlsVersion: 'TLS1_2'
      networkAcls: {
        bypass: 'Metrics'
        defaultAction: 'Deny'
        ipRules: []
        virtualNetworkRules: []
        resourceAccessRules: []
      }
  }
  
}

