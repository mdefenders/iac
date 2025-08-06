variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "region" {
  type        = string
  description = "Region for the GKE cluster"
}

variable "zone" {
  type        = string
  description = "Zone for the GKE cluster"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "argocd_chart_version" {
  description = "The Helm release for ArgoCD."
  type        = string
  default     = "8.2.5"
}

variable "machine_type" {
  description = "The machine type for the GKE nodes."
  type        = string
  default     = "e2-medium"
}

variable "spot" {
  description = "Use spot VMs for the GKE nodes."
  type        = bool
  default     = true
}
variable "min_node_count" {
    description = "Minimum number of nodes in the GKE node pool."
    type        = number
    default     = 0
}
variable "max_node_count" {
    description = "Maximum number of nodes in the GKE node pool."
    type        = number
    default     = 3
}