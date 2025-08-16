resource "oci_kms_vault" "itde_vault" {
  compartment_id = var.compartment_id
  display_name   = "itde-vault"
  vault_type     = "DEFAULT"
}

resource "oci_kms_key" "itde_key" {
  compartment_id      = var.compartment_id
  display_name        = "itde-key"
  management_endpoint = oci_kms_vault.itde_vault.management_endpoint
  key_shape {
    algorithm = "AES"
    length    = 32
  }
}

resource "oci_vault_secret" "itde_secret" {
  compartment_id = var.compartment_id
  secret_content {
    content_type = "BASE64"
    content      = base64encode(local.mysql_db_system_admin_password)
  }
  vault_id    = oci_kms_vault.itde_vault.id
  key_id      = oci_kms_key.itde_key.id
  secret_name = "db-password"
  description = "Database password"
}

resource "oci_identity_dynamic_group" "oke_nodes_dynamic_group" {
  compartment_id = var.compartment_id
  name           = var.dynamic_group_name
  description    = "Dynamic group for OKE worker nodes to access Vault secrets"
  matching_rule  = "ALL {instance.compartment.id = '${var.cluster_id}'}"
}

resource "oci_identity_policy" "oke_instance_policy" {
  compartment_id = var.compartment_id
  name           = "OKE-InstancePrincipal-ReadVault"
  description    = "Allow OKE nodes to read secrets from Vault"
  statements     = [
    "Allow dynamic-group 'Default'/'${var.dynamic_group_name}' to use secret-family in tenancy"
  ]
}
