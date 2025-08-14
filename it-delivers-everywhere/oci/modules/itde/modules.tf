module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.6.0"

  # Required Inputs
  compartment_id = var.tenancy_ocid

  # Optional Inputs
  region = var.region

  # Changing the following default values
  vcn_name                = var.vcn_display_name
  create_internet_gateway = true
  create_nat_gateway      = true
  create_service_gateway  = true

}
