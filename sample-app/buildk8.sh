kubectl create ns production

kubectl --namespace=production apply -f k8s/production -f k8s/staging -f k8s/services

kubectl --namespace=production scale deployment gceme-frontend-production --replicas=4

kubectl --namespace=production get service gceme-frontend

