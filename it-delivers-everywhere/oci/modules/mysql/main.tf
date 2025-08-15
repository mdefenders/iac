resource "oci_mysql_mysql_db_system" "mysql_db_system" {
  #Required
  availability_domain = var.mysql_db_system_availability_domain
  compartment_id      = var.compartment_id
  shape_name          = var.mysql_shape_name
  subnet_id           = var.subnet_id

  #Optional
  access_mode    = var.mysql_db_system_access_mode
  admin_username = var.mysql_db_system_admin_username
  admin_password = local.mysql_db_system_admin_password

  customer_contacts {
    #Required
    email = var.mysql_db_system_customer_contacts_email
  }

  is_highly_available = var.mysql_db_system_is_highly_available

}

resource "random_password" "mysql_admin" {
  length      = 16
  special     = true
  upper       = true
  lower       = true
  numeric     = true
  min_lower   = 2
  min_upper   = 2
  min_special = 2
  min_numeric = 2
}

locals {
  mysql_db_system_admin_password = var.mysql_db_system_admin_password != null ? var.mysql_db_system_admin_password : random_password.mysql_admin.result
}
