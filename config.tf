terraform {
  required_providers {
    azurerm = {
        version = "3.103.1"
        source = "hashicorp/azurerm"
    }
  }
  
  backend "remote" {
    organization = "azprolab"
    hostname = "app.terraform.io"
    workspaces {
      prefix = "project-ecommerce-"
    }
  }
}

provider "azurerm" {
  features {
  }
}