module "gke" {
  source       = "../../modules/gke"
  project_id   = var.project_id
  region       = var.region
  zone         = var.zone
  cluster_name = var.cluster_name
}
resource "helm_release" "appsets" {
  name             = "argo-appsets"
  namespace        = "argocd"
  repository       = "https://mdefenders.github.io/helmcharts"
  chart            = "argo-appsets"
  version          = "0.1.2"
  create_namespace = true
  depends_on       = [module.gke.argocd_helm_release]

  values = [file("${path.module}/values.yaml")]
}
