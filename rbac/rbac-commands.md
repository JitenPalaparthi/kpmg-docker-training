kubectl create namespace dev

### Create a private key

```openssl genrsa -out employee.key 2048```

### Request for the certificate by using csr

```openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=developers"```

### Creating the certificate 

```openssl x509 -req -in employee.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out employee.crt -days 500```

### Setup credentails with crt and private key

```kubectl config set-credentials employee --client-certificate=/Users/jpalapar/employee/.certs/employee.crt  --client-key=/Users/jpalapar/employee/.certs/employee.key```

### Setup the context

```kubectl config set-context employee-context --cluster=minikube --namespace=dev --user=employee```

```kubectl --context=employee-context get pods```

# test after running role and role bind

```kubectl --context=employee-context run --image jpalaparthi/fileuploader demo```
```kubectl --context=employee-context get pods```