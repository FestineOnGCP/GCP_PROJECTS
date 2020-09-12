export MY_ZONE=us-central1-a
gsutil cp gs://cloud-training/gcpfcoreinfra/mydeploy.yaml mydeploy.yaml
sed -i -e "s/PROJECT_ID/$DEVSHELL_PROJECT_ID/" mydeploy.yaml
sed -i -e "s/ZONE/$MY_ZONE/" mydeploy.yaml
gcloud deployment-manager deployments create my-first-depl --config mydeploy.yaml
sed -i -e 's/value: "apt-get update"/value: "apt-get update; apt-get install nginx-light -y"/' mydeploy.yaml
gcloud deployment-manager deploymnets update my-first-depl --config mydeploy.yaml
