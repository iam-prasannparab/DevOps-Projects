# Helm

**Status: not implemented.** Listed in the stack, but no chart is included in the supplied pipeline.

## What it does
Kubernetes package manager. It bundles manifests into a chart with configurable values, and installs or upgrades releases.

## Where it sits in the flow
Optional. It would sit in the CD stage, in place of or alongside raw `kubectl apply` manifests.

## What it receives and hands off
- **Receives:** a chart (`Chart.yaml`, `values.yaml`, templates) and values for the release.
- **Hands off:** a release of Kubernetes resources in the cluster.

## Which stage calls it
- **None currently.** If you add it, the CD stage or `kube_deploy.yml` would call `helm upgrade --install`. Also used for installing Prometheus and Grafana.
