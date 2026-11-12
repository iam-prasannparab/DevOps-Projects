# Apache Tomcat

## What it does
Servlet container. It runs the WAR file and serves the web application over HTTP.

## Where it sits in the flow
Inside the Docker image, and so inside the running container.

## What it receives and hands off
- **Receives:** the WAR copied into `webapps/`.
- **Hands off:** HTTP responses to users, on port 8080.

## Which stage calls it
- **Docker build** (CI, through Ansible): the Dockerfile uses `tomcat` as the base image and copies the WAR into `webapps/`.
- **Runtime** (CD and Kubernetes): the container starts Tomcat when a pod runs.

The example Dockerfile is in [`docker/Dockerfile.example`](../docker/Dockerfile.example).
