#!/bin/bash

#terraform, helm, kubectl, gcloud  assumed to be installed
#script usage: run.sh [gcp project id] [dev|stage|prod]

#here should be check that arg 1 and 2 provided and 2 match list of allowed values

gcloud config set project "$1"
cd terraform
terraform init
terraform workspace new "$2"
terraform apply -auto-approve
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

cd ..


helm install "$2" -f ./my-fueled-chart/values-"$2".yaml ./my-fueled-chart

sleep 2m
echo "your service available here: http://`kubectl get svc frontend-service -o jsonpath={".status.loadBalancer.ingress[*].ip"}`/"
