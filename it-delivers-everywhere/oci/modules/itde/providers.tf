provider "oci" {

  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# provider "helm" {
#   kubernetes = {
#     host                   = google_container_cluster.primary.endpoint
#     token                  = data.google_client_config.default.access_token
#     cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
#   }
# }
# data "google_client_config" "default" {}
