param name string
param location string = resourceGroup().location
param tags object = {}

param kind string = ''
param reserved bool = true
param sku object

var size = sku.name

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: name
  location: location
  tags: tags
  sku: sku
  kind: kind
  properties: {
    reserved: reserved
    elasticScaleEnabled: size == 'P1v3'
    maximumElasticWorkerCount: size == 'P1v3' ? 5 : 0
  }
}

output id string = appServicePlan.id
