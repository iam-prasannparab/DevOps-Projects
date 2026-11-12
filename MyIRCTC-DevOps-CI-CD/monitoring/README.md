# Monitoring: Prometheus and Grafana

**Status:** Planned. No Prometheus or Grafana configuration has been supplied or verified yet.

Planned setup:

1. Install Prometheus and Grafana in the cluster (Helm chart `kube-prometheus-stack` is a common choice).
2. Add Grafana's data source as Prometheus.
3. Build dashboards for node CPU and memory, pod restarts, pod health, and application availability.

Example PromQL (verify against your metric names after install):

```promql
# Pod restarts in the last 15 minutes
increase(kube_pod_container_status_restarts_total[15m])

# CPU usage per pod (cores)
sum(rate(container_cpu_usage_seconds_total{container!=""}[5m])) by (pod)

# Memory working set per pod (bytes)
sum(container_memory_working_set_bytes{container!=""}) by (pod)
```

Node and pod metrics come from kube-state-metrics and node-exporter, which the Helm chart installs. Application-level request metrics need the app to expose a metrics endpoint (for example through a JMX exporter on Tomcat).

Place Prometheus config in `prometheus/` and Grafana dashboard JSON in `grafana/dashboards/` once created.
