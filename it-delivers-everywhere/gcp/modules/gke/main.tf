resource "google_project_service" "required_apis" {
  for_each = toset([
    "container.googleapis.com",  # GKE
    "compute.googleapis.com",    # Networking
    "iam.googleapis.com",        # Service accounts
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
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name

  node_config {
    machine_type = "e2-medium"
    spot         = true   # use spot VMs (GKE >= 1.20+)
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 1

  autoscaling {
    min_node_count = 0
    max_node_count = 3
  }
}