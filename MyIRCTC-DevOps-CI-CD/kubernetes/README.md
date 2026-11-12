# Kubernetes

**Status:** Manifests are not supplied in this repository yet. The CD pipeline (`Jenkinsfile-CD`) runs `kube_deploy.yml` on the Ansible server, and that playbook is expected to apply these manifests.

Add the following when they are ready:

- `namespace.yaml`: the application namespace.
- `deployment.yaml`: Deployment with replicas, image reference, probes, and resource limits.
- `service.yaml`: Service of type `LoadBalancer` (or an Ingress with the AWS Load Balancer Controller).

Do not store Secrets in these files. Create them with `kubectl create secret` or an external secrets tool.
