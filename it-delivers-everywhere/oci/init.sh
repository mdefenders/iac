#!/usr/bin/env bash
#export OCI_USER=ocid1.user.oc1..aaaaaaaaalwx4pm7smbvxbpaqc4vybbx3it3cx3dd4anuepvdakiwtrplehq
#export OCI_TENANCY=ocid1.tenancy.oc1..aaaaaaaab7gvagdtkiayq4tp6vzgm2npi2kqco4x4vaaxll6bapbhig354sa
#export OCI_COMPARTMENT_ID=ocid1.tenancy.oc1..aaaaaaaab7gvagdtkiayq4tp6vzgm2npi2kqco4x4vaaxll6bapbhig354sa
#export OCI_REGION=il-jerusalem-1
STATE_BUCKET=adt-terraform-state-buckets

# Check if bucket exists before creation
if oci os bucket get --bucket-name $STATE_BUCKET &>/dev/null; then
  echo "Bucket $STATE_BUCKET already exists. Skipping creation."
else
oci os bucket create --name $STATE_BUCKET
oci os bucket update --bucket-name $STATE_BUCKET --versioning Enabled
fi
#
## Check if cluster exists before getting credentials
#if gcloud container clusters describe $CLUSTER --zone $ZONE --project $PROJECT &>/dev/null; then
#  gcloud container clusters get-credentials $CLUSTER --region=$ZONE --project=$PROJECT
#else
#  echo "Cluster $CLUSTER does not exist in project $PROJECT and zone $ZONE. Skipping get-credentials."
#fi
