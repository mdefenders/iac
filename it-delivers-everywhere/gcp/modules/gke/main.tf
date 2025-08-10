resource "google_project_service" "required_apis" {
  for_each = toset([
    "container.googleapis.com",       # GKE
    "compute.googleapis.com",         # Networking
    "iam.googleapis.com",             # Service accounts
    "networkservices.googleapis.com", # Gateways API
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
  depends_on       = [google_project_service.required_apis]
  deletion_protection = false
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
  depends_on = [google_container_cluster.primary]

}

resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_chart_version
  create_namespace = true
  depends_on       = [google_container_cluster.primary]
  # atomic           = true
}

resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  create_namespace = true
  set = [
    {
      name  = "controller.scope.enabled"
      value = "false"
    },
    {
      name  = "controller.service.externalTrafficPolicy"
      value = "Local"
    }
  ]

  depends_on = [google_container_cluster.primary]
  # atomic     = true
}

resource "helm_release" "gateways" {
  name       = "gke-gateways"
  namespace  = "default"
  repository = "https://mdefenders.github.io/helmcharts"
  chart      = "gke-gateways"
  version    = var.gateways_chart_version
  depends_on = [google_container_cluster.primary]
  # atomic     = true
}

resource "google_compute_firewall" "deny_ssh_except_trusted" {
  name    = "deny-ssh-except-trusted"
  network = "default"

  direction = "INGRESS"
  priority  = 1000

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_container_cluster.primary]

}

resource "google_compute_firewall" "allow_ssh_trusted" {
  name    = "allow-ssh-trusted"
  network = "default"

  direction = "INGRESS"
  priority  = 900

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.ssh_whitelist
  depends_on    = [google_container_cluster.primary]

}

resource "google_compute_firewall" "deny_dev_except_trusted" {
  name    = "deny-dev-except-trusted"
  network = "default"

  direction = "INGRESS"
  priority  = 1000

  deny {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  depends_on    = [google_container_cluster.primary]
  disabled      = var.public_access_enabled

}

resource "google_compute_firewall" "allow_dev_trusted" {
  name    = "allow-dev-trusted"
  network = "default"

  direction = "INGRESS"
  priority  = 900

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = var.dev_whitelist
  depends_on    = [google_container_cluster.primary]
}
