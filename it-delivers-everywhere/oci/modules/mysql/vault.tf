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

