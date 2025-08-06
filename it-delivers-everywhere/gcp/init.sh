#!/usr/bin/env bash
PROJECT="chrome-flight-435809-p8"
CLUSTER="dev-gke-cluster"
REGION="us-central1"
ZONE="us-central1-a"
STATE_BUCKET="gs://adt-terraform-state-buckets/"

gcloud auth login
gcloud auth application-default login
gcloud config set project $PROJECT
gcloud config set compute/zone $ZONE
gcloud config set compute/region $REGION
gcloud config list
gsutil mb -p $PROJECT -l $REGION $STATE_BUCKET
gcloud components install gke-gcloud-auth-plugin
gcloud container clusters get-credentials $CLUSTER --region=$ZONE --project=$PROJECT