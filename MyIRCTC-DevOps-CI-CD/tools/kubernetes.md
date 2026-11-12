# Kubernetes

**Status: planned.** The manifests are not supplied in this repository yet.

## What it does
Container orchestrator. It runs the application as pods, keeps the number of replicas running, and routes traffic to them.

## Where it sits in the flow
Phase 4 and Phase 5. The CD job deploys to Kubernetes, and users reach the pods through a Service and a Load Balancer.

## What it receives and hands off
- **Receives:** the Deployment, Service, and Namespace manifests, applied by Ansible. It pulls the image from Docker Hub.
- **Hands off:** running pods that serve traffic, and metrics for Prometheus.

## Which stage calls it
- **Deployment** (CD): `kube_deploy.yml` runs `kubectl apply` against the cluster.
