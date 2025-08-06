#!/usr/bin/env bash
ZONE=$(gcloud config get-value compute/zone)
REGION=${ZONE%-*}
gsutil mb -p $(gcloud config get-value project) -l $REGION gs://adt-terraform-state-buckets/