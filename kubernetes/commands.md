## Kubernetes commands

### Version

```kubectl version```

```kubectl cluster-info```

### API Resources

```kubectl api-resources```

### To get syntax

```kubectl explain namespace```


### Namespaces

```kubectl create -f test-namespace.yaml```

or

```kubectl apply -f test-namespace.yaml```

- To get existing object 

```kubectl get ns test```

```kubectl get ns test -o yaml```

```kubectl get ns test -o json```

- To edit 

```kubectl edit ns test```

- To get

```kubectl get po kube-proxy-tsfv8 -n kube-system -o yaml```

### Create a pod

```kubectl run nginx --image=nginx -n test```

### describe

```kubectl describe pod/csi-azurefile-node-8vs59 -n kube-system```

### POD Exec

- -c means container name
  
```kubectl exec -it kube-proxy-tsfv8 -c kube-proxy /bin/sh -n kube-system```

### Delete a pod

```kubectl delete po nginx -n test```

### To Delete a Service and a Pod same time

```kubectl delete services/nginx pods/nginx -n test```

### Service Types

- There are 3 kinds of service types
  
- ClusterIP :  The service can be accessable only inside the cluster using service IP
- NodePort  : The servvice can be accessed using Node IP address. There is a port limitation from 30000-32768 port range. The port can either given by us or by the kubernetes if not specified.
- LoadBalancer : The cloud provider gives the ip or url to access the services. Generally it is the most expensive option but to access the service outside of the cluster/ externally this is one of the best options.


### Labels and Selectors

- Labels are key value pairs.
- Selectors uses the labels of other resources to select

### Scale a ReplicationController

```kubectl scale --replicas=20 rc nginx -n test```

### Auto Scale

```kubectl autoscale rc nginx --min=1 --max=5 --cpu-percent=80```


### create a configmap from file 

```kubectl create configmap  nginx-conf --from-file=nginx.conf -n test```

### For testing

-- secret files should be properly configured to read
-- dont create secrets with default namespace because any body can access that namespace

### CreateContainerConfigError
  
  - if the secret or configmap is not optional for the pod/container then unless they are created prior to the creation of the pod, the pod creation gives this error.
  - That means some configurations are missing to create the pod [ They are either secret or configmap entities]