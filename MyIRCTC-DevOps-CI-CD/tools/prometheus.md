# Prometheus

**Status: planned.** No configuration is included yet.

## What it does
Metrics collection and time-series database. It scrapes metrics from Kubernetes and the application, and stores them.

## Where it sits in the flow
Phase 5 (Monitoring). It runs inside the cluster and watches the workloads.

## What it receives and hands off
- **Receives:** metrics scraped from kube-state-metrics, node-exporter, and the application.
- **Hands off:** stored time-series data, which Grafana queries.

## Which stage calls it
- **None in the pipeline.** Installed once in the cluster, through Helm (for example, `kube-prometheus-stack`).
