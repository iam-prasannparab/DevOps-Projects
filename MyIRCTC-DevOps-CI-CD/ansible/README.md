# Ansible

Configuration-management and automation layer between Jenkins and Docker/Kubernetes.

## Status

| File | Status |
|---|---|
| `create_image_regapp.yml` | **Not supplied.** Referenced by `Jenkinsfile-CI`. Add your playbook here before running the pipeline. |
| `kube_deploy.yml` | **Not supplied.** Referenced by `Jenkinsfile-CD`. Add your playbook here before running the pipeline. |
| `hosts.example` | Template for the inventory file (`/opt/docker/hosts` on the Ansible server). |

## Expected behaviour

- **`create_image_regapp.yml`** (called from CI): builds a Docker image from `/opt/docker` (Dockerfile + WAR copied by the SSH Publisher), tags it, and pushes it to Docker Hub.
- **`kube_deploy.yml`** (called from CD): applies the Kubernetes manifests to the cluster.

Both playbooks must be copied to `/opt/docker/` on the Ansible server, because the Jenkins `execCommand` uses those paths.
