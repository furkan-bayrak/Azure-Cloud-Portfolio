// 1. SET LOCATION TO NORWAY
param location string = 'norwayeast'
param vmName string = 'fleet-vm-01'
@secure()
param adminPassword string
param adminUsername string = 'azureuser'

param resourceTags object = {
  Environment: 'Lab'
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: '${vmName}-vnet'
  location: location
  tags: resourceTags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-02-01' = {
  name: '${vmName}-ip'
  location: location
  tags: resourceTags
  sku: {
    name: 'Standard' // <--- The Fix: Upgrade to Standard
  }
  properties: {
    publicIPAllocationMethod: 'Static' // <--- Required for Standard IPs
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: '${vmName}-nic'
  location: location
  tags: resourceTags
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: { id: publicIP.id }
          subnet: { id: vnet.properties.subnets[0].id }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: vmName
  location: location
  tags: resourceTags
  properties: {
    // 2. SET SIZE TO THE ONE WE FOUND AVAILABLE
    hardwareProfile: { vmSize: 'Standard_D2s_v3' } 
    
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: { storageAccountType: 'Standard_LRS' }
      }
    }
    networkProfile: {
      networkInterfaces: [ { id: nic.id } ]
    }
  }
}
