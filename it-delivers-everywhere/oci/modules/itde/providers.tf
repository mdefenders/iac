provider "oci" {

  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

data "oci_containerengine_cluster_kube_config" "kubeconfig" { cluster_id = oci_containerengine_cluster.oke-cluster.id }

data "external" "oke_token" {
  program = [
    "bash", "-c",
    "oci ce cluster generate-token --cluster-id ${oci_containerengine_cluster.oke-cluster.id} --region ${var.region} | jq -c '{token: .status.token}'"
  ]
}

provider "helm" {
  kubernetes = {
    host                   = yamldecode(data.oci_containerengine_cluster_kube_config.kubeconfig.content)["clusters"][0]["cluster"]["server"]
    token                  = data.external.oke_token.result["token"]
    cluster_ca_certificate = base64decode(yamldecode(data.oci_containerengine_cluster_kube_config.kubeconfig.content)["clusters"][0]["cluster"]["certificate-authority-data"])
  }
}

