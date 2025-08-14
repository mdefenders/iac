terraform {
  backend "oci" {
    bucket               = "adt-terraform-state-buckets"
    namespace            = "ax4chigfdisp"
    workspace_key_prefix = "oke/clusters/dev"
  }
}
