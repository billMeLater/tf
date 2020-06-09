terraform {
  backend "gcs" {
    bucket = "tfstate"
    prefix = "state-vk"
  }
}

locals {
  ws_configFile_gr = "config/group-role.yaml"
  ws_configContent_gr = fileexists(local.ws_configFile_gr) ? file(local.ws_configFile_gr) : "{}"
  ws_group-role = yamldecode(local.ws_configContent_gr)
}

module "infrastructure" {
  source = "./module/gcp"

  project     = "dev"

  group-role  = local.ws_group-role
}
