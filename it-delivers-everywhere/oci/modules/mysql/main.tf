resource "oci_mysql_mysql_db_system" "test_mysql_db_system" {
  #Required
  availability_domain = var.mysql_db_system_availability_domain
  compartment_id      = var.compartment_id
  shape_name          = var.mysql_shape_name
  subnet_id = oci_core_subnet.test_subnet.id

  #Optional
  access_mode    = var.mysql_db_system_access_mode
  admin_password = var.mysql_db_system_admin_password
  admin_username = var.mysql_db_system_admin_username
  backup_policy {

    #Optional
    copy_policies {
      #Required
      copy_to_region = var.mysql_db_system_backup_policy_copy_policies_copy_to_region

      #Optional
      backup_copy_retention_in_days = var.mysql_db_system_backup_policy_copy_policies_backup_copy_retention_in_days
    }
    defined_tags = { "foo-namespace.bar-key" = "value" }
    freeform_tags = { "bar-key" = "value" }
    is_enabled = var.mysql_db_system_backup_policy_is_enabled
    pitr_policy {
      #Required
      is_enabled = var.mysql_db_system_backup_policy_pitr_policy_is_enabled
    }
    retention_in_days = var.mysql_db_system_backup_policy_retention_in_days
    soft_delete       = var.mysql_db_system_backup_policy_soft_delete
    window_start_time = var.mysql_db_system_backup_policy_window_start_time
  }
  configuration_id = oci_audit_configuration.test_configuration.id
  crash_recovery   = var.mysql_db_system_crash_recovery
  customer_contacts {
    #Required
    email = var.mysql_db_system_customer_contacts_email
  }
  data_storage {

    #Optional
    is_auto_expand_storage_enabled = var.mysql_db_system_data_storage_is_auto_expand_storage_enabled
    max_storage_size_in_gbs        = var.mysql_db_system_data_storage_max_storage_size_in_gbs
  }
  data_storage_size_in_gb = var.mysql_db_system_data_storage_size_in_gb
  database_management     = var.mysql_db_system_database_management
  database_mode           = var.mysql_db_system_database_mode
  defined_tags = { "foo-namespace.bar-key" = "value" }
  deletion_policy {

    #Optional
    automatic_backup_retention = var.mysql_db_system_deletion_policy_automatic_backup_retention
    final_backup               = var.mysql_db_system_deletion_policy_final_backup
    is_delete_protected        = var.mysql_db_system_deletion_policy_is_delete_protected
  }
  description  = var.mysql_db_system_description
  display_name = var.mysql_db_system_display_name
  encrypt_data {
    #Required
    key_generation_type = var.mysql_db_system_encrypt_data_key_generation_type

    #Optional
    key_id = oci_kms_key.test_key.id
  }
  fault_domain        = var.mysql_db_system_fault_domain
  freeform_tags = { "bar-key" = "value" }
  hostname_label      = var.mysql_db_system_hostname_label
  ip_address          = var.mysql_db_system_ip_address
  is_highly_available = var.mysql_db_system_is_highly_available
  maintenance {
    #Required
    window_start_time = var.mysql_db_system_maintenance_window_start_time
  }
  nsg_ids = var.mysql_db_system_nsg_ids
  port    = var.mysql_db_system_port
  port_x  = var.mysql_db_system_port_x
  read_endpoint {

    #Optional
    exclude_ips                  = var.mysql_db_system_read_endpoint_exclude_ips
    is_enabled                   = var.mysql_db_system_read_endpoint_is_enabled
    read_endpoint_hostname_label = var.mysql_db_system_read_endpoint_read_endpoint_hostname_label
    read_endpoint_ip_address     = var.mysql_db_system_read_endpoint_read_endpoint_ip_address
  }
  rest {
    #Required
    configuration = var.mysql_db_system_rest_configuration

    #Optional
    port = var.mysql_db_system_rest_port
  }
  secure_connections {
    #Required
    certificate_generation_type = var.mysql_db_system_secure_connections_certificate_generation_type

    #Optional
    certificate_id = oci_apigateway_certificate.test_certificate.id
  }
  source {
    #Required
    source_type = var.mysql_db_system_source_source_type

    #Optional
    # source_url = var.mysql_db_system_source_source_url
    backup_id = oci_mysql_mysql_backup.test_backup.id
  }
}