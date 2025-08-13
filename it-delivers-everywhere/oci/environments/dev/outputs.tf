terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">=7.4.0"
    }
  }
}
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

output "all-availability-domains-in-your-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}
output "compartment-name" {
  value = module.itde.compartment-name
}

output "compartment-OCID" {
  value = module.itde.compartment-OCID
}

output "vcn_id" {
  description = "OCID of the VCN that is created"
  value       = module.itde.vcn_id
}
output "id-for-route-table-that-includes-the-internet-gateway" {
  description = "OCID of the internet-route table. This route table has an internet gateway to be used for public subnets"
  value       = module.itde.id-for-route-table-that-includes-the-internet-gateway
}
output "nat-gateway-id" {
  description = "OCID for NAT gateway"
  value       = module.itde.nat-gateway-id
}
output "id-for-for-route-table-that-includes-the-nat-gateway" {
  description = "OCID of the nat-route table - This route table has a nat gateway to be used for private subnets. This route table also has a service gateway."
  value       = module.itde.id-for-for-route-table-that-includes-the-nat-gateway
}

output "private-security-list-name" {
  value = module.itde.private-security-list-name
}
output "private-security-list-OCID" {
  value = module.itde.private-security-list-OCID
}

output "public-security-list-name" {
  value = module.itde.public-security-list-name
}
output "public-security-list-OCID" {
  value = module.itde.public-security-list-OCID
}

output "private-subnet-name" {
  value = module.itde.private-subnet-name
}
output "private-subnet-OCID" {
  value = module.itde.private-subnet-OCID
}

# Outputs for public subnet

output "public-subnet-name" {
  value = module.itde.public-subnet-name
}
output "public-subnet-OCID" {
  value = module.itde.public-subnet-OCID
}


# Outputs for k8s cluster

output "cluster-name" {
  value = module.itde.cluster-name
}
output "cluster-OCID" {
  value = module.itde.cluster-OCID
}
output "cluster-kubernetes-version" {
  value = module.itde.cluster-kubernetes-version
}
output "cluster-state" {
  value = module.itde.cluster-state
}

# Outputs for k8s node pool

output "node-pool-name" {
  value = module.itde.node-pool-name
}
output "node-pool-OCID" {
  value = module.itde.node-pool-OCID
}
output "node-pool-kubernetes-version" {
  value = module.itde.node-pool-kubernetes-version
}
output "node-size" {
  value = module.itde.node-size
}
output "node-shape" {
  value = module.itde.node-shape
}
