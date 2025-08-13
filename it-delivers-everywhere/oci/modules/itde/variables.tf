variable "tenancy_ocid" {
  description = "The OCID of the tenancy"
  type        = string
}
variable "user_ocid" {
  description = "The OCID of the user"
  type        = string
}
variable "fingerprint" {
  description = "The fingerprint of the user's API key"
  type        = string
}
variable "private_key_path" {
  description = "The path to the private key file"
  type        = string
}
variable "region" {
  description = "The region to deploy resources in"
  type        = string
}
variable "vcn_display_name" {
  description = "The display name for the VCN"
  type        = string
  default     = "oke-vcn"
}

variable "private_sec_list_name" {
  description = "Private security List Name"
  type        = string
  default     = "security-list-for-private-subnet"
}

variable "public_sec_list_name" {
  description = "Public security List Name"
  type        = string
  default     = "security-list-for-public-subnet"
}

variable "private_cidr_block" {
  description = "Private Sunbet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_name" {
  description = "Private Subnet Name"
  type        = string
  default     = "private-subnet"
}

variable "public_cidr_block" {
  description = "Public Sunbet CIDR"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_name" {
  description = "Public Subnet Name"
  type        = string
  default     = "public-subnet"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "v1.33.1"
}

variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
  default     = "it-delivers-everywhere"
}

variable "enable_dashboard" {
  description = "Enable Kubernetes Dashboard"
  type        = bool
  default     = false
}

variable "kubernetes_pod_cidr" {
  description = "Kubernetes network pod CIDR"
  type        = string
  default     = "10.244.0.0/16"
}

variable "kubernetes_service_cidr" {
  description = "Kubernetes network servoce CIDR"
  type        = string
  default     = "10.96.0.0/16"
}

variable "node_pull_name" {
  description = "Kubernetes Node Pool name"
  type        = string
  default     = "pool1"
}

variable "node_pull_size" {
  description = "Kubernetes Node Pool size"
  type        = number
  default     = 3
}

variable "node_shape" {
  description = "Kubernetes Nodes Shape"
  type        = string
  default     = "VM.Standard2.1"
}

variable "node_image_ocid" {
  description = "Kubernetes Node Image OCID"
  type        = string
}