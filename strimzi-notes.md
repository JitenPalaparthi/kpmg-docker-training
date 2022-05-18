
- Kafka. A cluster of Kafka broker nodes
- ZooKeeper. Storing configuration data and cluster coordination
- Kafka Connect. An integration toolkit for streaming data between Kafka brokers and external systems using Connector (source and sink) plugins. (Also supports Source2Image)
- Kafka MirrorMaker. Replicating data between two Kafka clusters, within or across data centers.
- Kafka Bridge. Providing a RESTful interface for integrating HTTP-based clients with a Kafka cluster without the need for client applications to understand the Kafka protocol
- Kafka Exporter. Extracting data for analysis as Prometheus metrics like offsets, consumer groups, consumer lag, topics

### How to run prometheus 

- step-1 create a namespace monitoring
  
  ```kubectl create ns monitoring```
- step-2 Download prometheus operator bundle
```curl -s https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/master/bundle.yaml>bundle.yaml```
- step-3 change namespace: default to namespace: monitoring in the bundle file
- step-4 ```kubectl create -f bundle.yaml -n monitoring```
- step-5 never do the below step/
  - step-5.A (Dont do) ```kubectl create secret generic additional-scrape-configs --from-file=examples/metrics/prometheus-additional-properties/prometheus-additional.yaml -n monitoring```
  - Step-5.B : ```kubectl apply -n monitoring examples/metrics/prometheus-additional-properties/prometheus-additional.yaml ```
- step-6 go to files in examples/metrics/prometheus-install change to 
  ```namespaceSelector:
    matchNames:
      - kafka```
- step-7 go to directory examples/metrics/prometheus-install run

```kubectl create -f examples/metrics/prometheus-install/strimzi-pod-monitor.yaml -n monitoring```
```kubectl create -f examples/metrics/prometheus-install/prometheus-rules.yaml -n monitoring``` 
```kubectl create -f examples/metrics/prometheus-install/prometheus.yaml -n monitoring``` 

- step-8 get the pods 
```kubectl get pods -n monitoring```

- step-9 run grafana file from examples/metrics/grafana-install
``` kubectl create -f grafana.yaml -n monitoring```

- Step-10 port-forward grafana 
```kubectl port-forward svc/grafana 3000:3000 -n monitoring```

