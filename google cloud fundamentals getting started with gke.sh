export MY_ZONE=us-central1-a
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2
kubectl create deploy nginx --image nginx:1.17.10
kubectl expose deployment nginx --port 80 --type LoadBalancer
kubectl scale deployment nginx --replicas 3
