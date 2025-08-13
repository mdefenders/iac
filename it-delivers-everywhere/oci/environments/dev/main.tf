module "itde" {
  source           = "../../modules/itde"
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
  vcn_display_name = var.vcn_display_name
  node_image_ocid  = var.node_image_ocid
}
