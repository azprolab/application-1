data "terraform_remote_state" "rg" {
    backend = "remote"
    # workspace = "resource-group-${var.environment}"
    config = {
        organization = "azprolab"
        workspaces = {
            name = "resource-group-${var.environment}"
        }
  }
}

module "vnw" {
    source = "git::https://github.com/azmodules/network.git"

    nw_vnet_name = "sree-${var.project_code}-${var.location}-${var.environment}-vnet"
    nw_resource_group_name = data.terraform_remote_state.rg.outputs.resource_group_name
    nw_location =  data.terraform_remote_state.rg.outputs.resource_group_location
    nw_address_space = var.nw_address_space
    nw_subnet_address_prefixes = var.nw_subnet_address_prefixes
}
