# Load module
terraform {
  required_version = "0.15.1"
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = "1.5.1"
    }
  }
}

# Configure the Akamai Provider
provider "akamai" {
  edgerc = "~/.edgerc"
  config_section = "jp-all"
}

# Define a security configuration
resource "akamai_appsec_configuration" "create_config" {
  name = "shki-ksd-tf-01"
  description = "made by terraform"
  contract_id= "1-GNLXD"
  group_id  = "179232"
  host_names = ["netlify-nextjs-dsa.ff-duma.shki.tokyo"]
}

# Show configuration ID and version
output "create_config_id" {
  value = akamai_appsec_configuration.create_config.config_id
}

output "create_config_version" {
  value = akamai_appsec_configuration.create_config.version
}
