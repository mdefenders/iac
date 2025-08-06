resource "google_project_service" "required_apis" {
  for_each = toset([
    "container.googleapis.com", # GKE
    "compute.googleapis.com",   # Networking
    "iam.googleapis.com",       # Service accounts
  ])
  project = var.project_id
  service = each.value
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE" # Enables alias IPs
  timeouts {
    create = "30m"
    update = "40m"
    delete = "20m"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  location = var.zone
  cluster  = google_container_cluster.primary.name

  node_config {
    machine_type = var.machine_type
    spot         = var.spot
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 1

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
  create_namespace = true
  depends_on       = [google_container_cluster.primary]
}
