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

variable "service_whitelist" {
  description = "List of IPs/subnets allowed to access services/load balancers."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Replace with your IPs/subnets
}

variable "appsets_chart_version" {
  description = "Version of the argo-appsets Helm chart"
  type        = string
}

variable "ssh_whitelist" {
  description = "List of IPs/subnets allowed to access ovefr ssh."
  type        = list(string)
  default     = ["0.0.0.0/0"] # Replace with your IPs/subnets
}

variable "dev_whitelist" {
  description = "List of IPs/subnets allowed to access dev services/load balancers."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "public_access_enabled" {
  description = "Enable public access to the cluster workloads ingress."
  type        = bool
  default     = false
}