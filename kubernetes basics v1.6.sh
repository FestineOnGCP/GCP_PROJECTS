git clone https://github.com/googlecodelabs/orchestrate-with-kubernetes.git
cd orchestrate-with-kubernetes/kubernetes
gcloud config set compute/zone us-central1-a
gcloud container clusters create bootcamp --num-nodes 5 --scopes "https://www.googleapis.com/auth/projecthosting,storage-rw"
kubectl create deployment nginx --image=nginx:1.10.0
kubectl expose deployment nginx --port 80 --type LoadBalancer
kubectl scale deployment nginx --replicas 3
kubectl delete deployment nginx
kubectl delete service nginx
kubectl create -f pods/monolith.yaml
kubectl create -f pods/healthy-monolith.yaml
kubectl create secret generic tls-certs --from-file tls/
kubectl create configmap nginx-proxy-conf --from-file nginx/proxy.conf
kubectl create -f pods/secure-monolith.yaml
kubectl create -f services/monolith.yaml
gcloud compute firewall-rules create allow-monolith-nodeport --allow=tcp:31000
kubectl label pods secure-monolith 'secure=enabled'
