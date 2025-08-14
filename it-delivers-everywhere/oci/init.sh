#!/usr/bin/env bash
STATE_BUCKET=adt-terraform-state-buckets

# Check if bucket exists before creation
if oci os bucket get --bucket-name $STATE_BUCKET &>/dev/null; then
  echo "Bucket $STATE_BUCKET already exists. Skipping creation."
else
oci os bucket create --name $STATE_BUCKET
oci os bucket update --bucket-name $STATE_BUCKET --versioning Enabled
fi
