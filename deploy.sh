NAME="kubernetes-skill-up-api"
USERNAME="gaziwani"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image ..."
docker build -t $IMAGE

echo "Pushing image to docker Hub ..."
docker push $IMAGE

echo "Applying Kubernetes manifests ..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods ..."
kubectl get pods 

echo "Getting service ..."
kubectl get services

echo "Fetching the main service"
kubectl get service $NAME-service