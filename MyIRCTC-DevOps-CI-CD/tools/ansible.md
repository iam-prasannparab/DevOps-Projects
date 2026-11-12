# Ansible

## What it does
Automation tool. It runs playbooks that build Docker images and deploy to Kubernetes, on the Ansible server.

## Where it sits in the flow
Between Jenkins and the Docker and Kubernetes tools. It is used twice: once for image creation (CI) and once for deployment (CD).

## What it receives and hands off
- **Receives:** the WAR file and the `create_image_regapp.yml` playbook from Jenkins (CI), and the `kube_deploy.yml` playbook from Jenkins (CD). Its inventory is `/opt/docker/hosts`.
- **Hands off:** Docker build and push commands to Docker, and `kubectl` apply commands to Kubernetes.

## Which stage calls it
- **Docker Image with Artifact** (CI): `ansible-playbook -i /opt/docker/hosts /opt/docker/create_image_regapp.yml`
- **Deployment** (CD): `ansible-playbook -i /opt/docker/hosts /opt/docker/kube_deploy.yml`

Both playbooks are not included in this repository yet. See [`ansible/README.md`](../ansible/README.md).
