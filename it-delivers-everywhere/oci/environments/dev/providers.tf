provider "helm" {
  kubernetes = {
    host                   = module.itde.host
    token                  = module.itde.token
    cluster_ca_certificate = module.itde.cluster_ca_certificate
  }
}