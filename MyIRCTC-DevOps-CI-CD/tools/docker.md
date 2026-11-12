# Docker

## What it does
Packages the application and its runtime into a container image. It builds the image from a Dockerfile and runs containers from it.

## Where it sits in the flow
Phase 3 (Containerization). It runs on the Ansible server, after the WAR is copied there and before Docker Hub.

## What it receives and hands off
- **Receives:** the Dockerfile and the WAR from `/opt/docker`.
- **Hands off:** a tagged image, pushed to Docker Hub.

## Which stage calls it
- **Docker Image with Artifact** (CI): the playbook `create_image_regapp.yml` runs `docker build` and `docker push`.
- **Runtime**: Kubernetes runs the image as containers.

The example Dockerfile is in [`docker/Dockerfile.example`](../docker/Dockerfile.example).
