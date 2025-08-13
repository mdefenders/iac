# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster

resource "oci_containerengine_cluster" "oke-cluster" {
  # Required
  compartment_id     = oci_identity_compartment.tf-compartment.id
  kubernetes_version = var.kubernetes_version
  name               = var.cluster_name
  vcn_id             = module.vcn.vcn_id

  # Optional
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = var.enable_dashboard
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = var.kubernetes_pod_cidr
      services_cidr = var.kubernetes_service_cidr
    }
    service_lb_subnet_ids = [oci_core_subnet.vcn-public-subnet.id]
  }
}
