# AWS

## What it does
Cloud provider. It hosts the servers and the Kubernetes cluster. Route 53 and the Load Balancer are part of it.

## Where it sits in the flow
Underneath Phases 3 to 5. The Jenkins server, Ansible server, and EKS cluster run on AWS infrastructure.

## What it receives and hands off
- **Receives:** requests from Terraform, the AWS CLI, and users.
- **Hands off:** running servers, the EKS cluster, Load Balancers, and DNS through Route 53.

## Which stage calls it
- **Deployment** (CD): the EKS cluster is reached through `kubectl`.
- **Setup:** Terraform or the AWS console creates the resources.

Cost note: EC2, EKS, and Load Balancers incur ongoing charges.
