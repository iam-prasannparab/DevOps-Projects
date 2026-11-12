# AWS EKS

**Status: planned.** The cluster is not created by any supplied file.

## What it does
Managed Kubernetes service on AWS. AWS runs the control plane, and you run the worker nodes.

## Where it sits in the flow
Phase 4 and Phase 5. It is the cluster that receives the deployment from Ansible and runs the pods.

## What it receives and hands off
- **Receives:** deployment requests from `kubectl` (via Ansible), and images pulled from Docker Hub.
- **Hands off:** running pods, a Load Balancer endpoint, and cluster metrics.

## Which stage calls it
- **Deployment** (CD): through `kubectl` in `kube_deploy.yml`, which requires a kubeconfig for the cluster on the Ansible server.

Cost note: the EKS control plane and the EC2 worker nodes incur ongoing charges.
