terraform {
  required_version = ">= 1.12.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0"
    }
    oci = {
      source  = "oracle/oci"
      version = ">=7.4.0"
    }
  }
}
