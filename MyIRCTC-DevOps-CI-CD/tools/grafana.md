# Grafana

**Status: planned.** No dashboards are included yet.

## What it does
Visualization tool. It draws dashboards from metrics data sources.

## Where it sits in the flow
Phase 5 (Monitoring), after Prometheus. It is the view a user looks at.

## What it receives and hands off
- **Receives:** query results from Prometheus, using PromQL.
- **Hands off:** dashboards showing CPU, memory, pod restarts, and node health.

## Which stage calls it
- **None in the pipeline.** Installed once in the cluster, and it reads from the Prometheus data source.
