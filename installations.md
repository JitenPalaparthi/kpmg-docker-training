### To Install metrics server

- ```kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml```

### To check metrics server is installed 

```kubectl get deployment metrics-server -n kube-system```


### To run Helm charts

```helm repo add prometheus-community https://prometheus-community.github.io/helm-charts```

```helm install prometheus prometheus-community/prometheus```

### To portforward

```kubectl port-forward deployment/mongo 28015:27017```
