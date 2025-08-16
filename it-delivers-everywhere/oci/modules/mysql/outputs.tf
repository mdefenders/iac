output "access_mode" {
  value = oci_mysql_mysql_db_system.mysql_db_system.access_mode
}
output "admin_username" {
  value = oci_mysql_mysql_db_system.mysql_db_system.admin_username
}
output "data_storage_size_in_gb" {
  value = oci_mysql_mysql_db_system.mysql_db_system.data_storage_size_in_gb
}
output "database_mode" {
  value = oci_mysql_mysql_db_system.mysql_db_system.database_mode
}
output "display_name" {
  value = oci_mysql_mysql_db_system.mysql_db_system.display_name
}
output "endpoints" {
  value = oci_mysql_mysql_db_system.mysql_db_system.endpoints
}
output "id" {
  value = oci_mysql_mysql_db_system.mysql_db_system.id
}
output "ip_address" {
  value = oci_mysql_mysql_db_system.mysql_db_system.ip_address
}
output "mysql_version" {
  value = oci_mysql_mysql_db_system.mysql_db_system.mysql_version
}
output "port" {
  value = oci_mysql_mysql_db_system.mysql_db_system.port
}
output "data_storage" {
  value = oci_mysql_mysql_db_system.mysql_db_system.data_storage
}
output "vault_ocid" {
  value = oci_kms_vault.itde_vault.id
}

output "secret_ocid" {
  value = oci_vault_secret.itde_secret.id
}
