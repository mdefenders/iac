module "gke" {
  source               = "../../modules/gke"
  project_id           = var.project_id
  region               = var.region
  zone                 = var.zone
  cluster_name         = var.cluster_name
  argocd_chart_version = var.argocd_chart_version
  spot                 = var.spot
  min_node_count       = var.min_node_count
  max_node_count       = var.max_node_count
}
resource "helm_release" "appsets" {
  name             = "argo-appsets"
  namespace        = "argocd"
  repository       = "https://mdefenders.github.io/helmcharts"
  chart            = "argo-appsets"
  version          = var.appsets_chart_version
  create_namespace = true
  depends_on       = [module.gke.argocd_helm_release]
  values           = [file("${path.module}/values.yaml")]
}
