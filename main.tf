# Criação do grupo de recursos
resource "azurerm_resource_group" "my_resource_group" {
  name     = "my-resource-group"
  location = "eastus"
}

# Criação da rede virtual
resource "azurerm_virtual_network" "my_virtual_network" {
  name                = "my-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name
}

# Criação da sub-rede
resource "azurerm_subnet" "my_subnet" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.my_resource_group.name
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name
  address_prefixes     = ["10.0.1.0/24"]
}
