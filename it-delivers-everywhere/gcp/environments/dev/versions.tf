data "google_client_config" "default" {}
provider "helm" {
  kubernetes = {
    host                   = module.gke.kubernetes_endpoint
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.cluster_ca_certificate)
  }
}
