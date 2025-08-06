output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "gke_endpoint" {
  value = module.gke.kubernetes_endpoint
}

output "argocd_initial_admin_password" {
  value = module.gke.argocd_initial_admin_password
    sensitive = true
}
