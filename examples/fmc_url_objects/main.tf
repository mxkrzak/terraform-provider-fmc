terraform {
  required_providers {
    fmc = {
      source = "hashicorp.com/edu/fmc"
    }
  }
}

provider "fmc" {
  fmc_username = "api"
  fmc_password = "CXsecurity!@34"
  fmc_host = "10.106.107.228"
  fmc_insecure_skip_verify = true
}

data "fmc_url_objects" "existing" {
  name = "Guacamole"
  url = "http://guacamole.adyah.cisco"
}

# resource "fmc_url_objects" "new" {
#   name        = "terraform_bulk_url_object_21"
#   url       = "http://wwwin.ami.cisco.com"
#   description = "My Scale Test Terraform URL Object"
# }

resource "fmc_url_objects" "similar" {
  name = "${data.fmc_url_objects.existing.name}-similar"
  url = data.fmc_url_objects.existing.url
}

output "existing" {
  value = data.fmc_url_objects.existing
}

output "similar" {
  value = fmc_url_objects.similar
}
# output "new_fmc_url_object" {
#   value = fmc_url_objects.new
# }
