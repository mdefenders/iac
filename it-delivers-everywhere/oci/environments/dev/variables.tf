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

variable "node_image_ocid" {
  description = "Kubernetes Node Image OCID"
  type        = string
}