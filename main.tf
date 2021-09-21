provider "azurerm" {
  version = "2.5.0"
  features {}
}

resource "azurerm_resource_group" "tf_test_rg" {
    name = "tftestrg"
    location = "Norway East"
}

resource "azurerm_container_group" "tfcg_rest" {
    name                = "weatherapi"
    location            = azurerm_resource_group.tf_test_rg.location
    resource_group_name = azurerm_resource_group.tf_test_rg.name

    ip_address_type     = "public"
    dns_name_label      = "apaulsberg"
    os_type             = "linux"

    container {
      name              = "weatherapi"
      image             = "apaulsberg/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        } 
    } 
}