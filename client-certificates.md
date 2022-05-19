### Where is crt and password

- ca.crt and ca.password are in a secret file my-cluster-cluster-ca-cert, provided by cluster name is my-cluster and namespace is my-kafka-project
- To fetch ca.crt and ca.password from the secret use below commands. 


```kubectl get secret my-cluster-cluster-ca-cert -n my-kafka-project -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt```

- Keystore path is java security path. If there are many java versions running in yoru system, you should use proper path.

```sudo keytool --importcert --alias strimzi-kafka-cert -file /home/jiten/kafka/kafka_2.12-3.1.0/bin/certs/ca.crt -keystore /usr/lib/jvm/java-1.11.0-openjdk-amd64/lib/security/cacerts```

```sudo keytool --importcert --alias strimzi-kafka-cert -file /home/jiten/kafka/kafka_2.12-3.1.0/bin/certs/ca.crt -keystore /etc/ssl/certs/java/cacerts```

-To delete the certificate

```sudo keytool -delete -alias strimzi-kafka-cert  -keystore /etc/ssl/certs/java/cacerts```


- to check whether the certificate is stored or not 
  
  ```sudo keytool -list -alias strimzi-kafka-cert -keystore /etc/ssl/certs/java/cacerts```

- If there are any ssl issues from consumer or producer particularly when using java based kafka clients, enable the below logs.
- 
```export KAFKA_OPTS="-Djavax.net.debug=ssl"```

- To use golang test application setup the below environment variables w.r.t your setup

```export KAFKA_BOOTSTRAP_SERVERS=192.168.49.2:30405```
```export CA_CERT_LOCATION=/home/jiten/workspace/personal/kpmg-docker-training/kafka-go-client/ca.crt```
```export KAFKA_TOPIC=my-topic```