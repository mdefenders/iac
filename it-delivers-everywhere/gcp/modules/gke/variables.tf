variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "zone" {
  description = "The GCP zone."
  type        = string
}

variable "cluster_name" {
  description = "The GKE cluster name."
  type        = string
}

variable "argocd_chart_version" {
  description = "The Helm release for ArgoCD."
  type        = string
}

variable "machine_type" {
  description = "The machine type for the GKE nodes."
  type        = string
  default     = "e2-medium"
}

variable "spot" {
  description = "Use spot VMs for the GKE nodes."
  type        = bool
  default     = false
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