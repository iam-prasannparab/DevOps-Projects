# Docker Hub

## What it does
Container image registry. It stores the images and makes them available to Kubernetes.

## Where it sits in the flow
Between the Ansible server (Phase 3) and the Kubernetes cluster (Phase 5).

## What it receives and hands off
- **Receives:** the image pushed by the Ansible playbook.
- **Hands off:** the image to Kubernetes, which pulls it when it starts pods.

## Which stage calls it
- **Docker Image with Artifact** (CI): the playbook pushes the image after the build.
- **Kubernetes** pulls the image during deployment.

Log in on the Ansible server with `docker login` before the push.
