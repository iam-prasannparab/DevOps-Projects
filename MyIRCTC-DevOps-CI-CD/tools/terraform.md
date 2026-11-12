# Terraform

**Status: not implemented.** No Terraform code is included in the supplied files.

## What it does
Infrastructure as code. It creates AWS resources (VPC, subnets, EKS, IAM) from declared configuration.

## Where it sits in the flow
Before the pipeline. It would create the infrastructure that the Ansible server and the Kubernetes cluster run on.

## What it receives and hands off
- **Receives:** `.tf` files and variables.
- **Hands off:** the AWS resources, plus outputs such as the cluster name and endpoint.

## Which stage calls it
- **None in the pipeline.** Run it manually: `terraform init`, `terraform plan`, `terraform apply`, and `terraform destroy` when finished.
