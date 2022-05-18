### Where is crt and password

- ca.crt and ca.password are in a secret file my-cluster-cluster-ca-cert, provided by cluster name is my-cluster and namespace is my-kafka-project
- To fetch ca.crt and ca.password from the secret use below commands. 


```kubectl get secret my-cluster-cluster-ca-cert -n my-kafka-project -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt```

```kubectl get secret my-cluster-cluster-ca-cert -n my-kafka-project -o jsonpath='{.data.ca\.password}' | base64 -d > ca.password```

- for java clients  to store the ca.crt use keytool keystore

-- /etc/ssl/certs/java/cacerts

```sudo keytool --importcert --alias strimzi-kafka-cert -file ca.crt -keystore /etc/ssl/certs/java/cacerts -keypass igIHnWyXPxst```


- to check whether the certificate is stored or not 
  
  ```sudo keytool -list -alias strimzi-kafka-cert -keystore /etc/ssl/certs/java/cacerts```
