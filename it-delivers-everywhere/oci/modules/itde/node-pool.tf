# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool" {
  # Required
  cluster_id         = oci_containerengine_cluster.oke-cluster.id
  compartment_id     = oci_identity_compartment.tf-compartment.id
  kubernetes_version = var.kubernetes_version
  name               = var.node_pull_name
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = oci_core_subnet.vcn-private-subnet.id
    }

    size = var.node_pull_size
  }
  node_shape = var.node_shape

  # Using image Oracle-Linux-7.x-<date>
  # Find image OCID for your region from https://docs.oracle.com/iaas/images/
  node_source_details {
    image_id    = var.node_image_ocid
    source_type = "image"
  }

  # Optional
  initial_node_labels {
    key   = "name"
    value = var.cluster_name
  }
}
