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
