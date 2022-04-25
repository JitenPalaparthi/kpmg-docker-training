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
