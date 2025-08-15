variable "mysql_db_system_availability_domain" {
  description = "MySQL db system availability domain"
  type        = string
}

variable "compartment_id" {
  description = "Compartment OCID where the MySQL DB system will be created"
  type        = string
}

variable "mysql_shape_name" {
  description = "The shape of the MySQL DB system"
  type        = string
  default     = "MySQL.Free"
}
variable "subnet_id" {
  description = "The OCID of the subnet where the MySQL DB system will be created"
  type        = string
}
variable "mysql_db_system_access_mode" {
  description = "The access mode for the MySQL DB system"
  type        = string
  default     = "UNRESTRICTED"
}
variable "mysql_db_system_backup_policy_copy_policies_copy_to_region" {
  description = "The region to copy backups to"
  type        = string
  default     = "us-sanjose-1"
}
variable "mysql_db_system_backup_policy_is_enabled" {
  description = "Whether the backup policy is enabled"
  type        = bool
  default     = false
}
variable "mysql_db_system_backup_policy_pitr_policy_is_enabled" {
  description = "Whether the PITR policy is enabled"
  default     = false
  type        = bool
}
variable "mysql_db_system_customer_contacts_email" {
  description = "Email for customer contacts"
  type        = string
}
variable "mysql_db_system_is_highly_available" {
  description = "Whether the MySQL DB system is highly available"
  type        = bool
  default     = false
}

variable "mysql_db_system_admin_password" {
  description = "Admin password for the MySQL DB system. Must be 8-32 characters, contain at least one uppercase letter, one lowercase letter, one number, and one special character."
  type        = string
  sensitive   = true
  default     = null
}

variable "mysql_db_system_admin_username" {
  description = "Admin username for the MySQL DB system. Default is 'admin'."
  type        = string
  sensitive   = true
  default     = "admin"
}
