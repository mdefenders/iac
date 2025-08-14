module "itde" {
  source               = "../../modules/itde"
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
  vcn_display_name     = var.vcn_display_name
  node_image_ocid      = var.node_image_ocid
  argocd_chart_version = var.argocd_chart_version
}

# resource "helm_release" "appsets" {
#   name             = "argo-appsets"
#   namespace        = "argocd"
#   repository       = "https://mdefenders.github.io/helmcharts"
#   chart            = "argo-appsets"
#   version          = var.appsets_chart_version
#   create_namespace = true
#   depends_on       = [module.itde.argocd_helm_release]
#   values           = [file("${path.module}/values.yaml")]
#   atomic           = true
# }
