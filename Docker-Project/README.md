# Project 2: Deploy a `.war` to Tomcat on Docker via Jenkins

Extends Project 1. Jenkins builds the `.war` file, then publishes it over SSH to a Docker server, where a custom Tomcat image rebuilds and runs it as a container.

## Overview

| Item | Details |
|------|---------|
| Docker host | Separate AWS EC2 instance, provisioned manually |
| Container runtime | Docker |
| Application server | Apache Tomcat (official `tomcat` image) |
| CI server | Jenkins (from Project 1) |
| File transfer | Publish over SSH plugin |
| Deploy location | `/opt/docker` on the Docker server |
| App URL | `http://<docker-server-public-IP>:8080/hello-app/` |

## Architecture

```
Developer ──push──> GitHub repo
                        │
                        ▼
              Jenkins: mvn clean package
                        │
                        │ Publish over SSH (copies .war)
                        ▼
          Docker server: /opt/docker/
          ├── Dockerfile
          └── hello-app.war
                        │
                        │ docker build + docker run
                        ▼
          Tomcat container ──port 8080──> browser
```

## Step 1: Set Up the Docker Server

1. Launched a separate EC2 instance and installed Docker on it.
2. Pulled the official Tomcat image:

   ```bash
   sudo docker pull tomcat:10.1-jdk21
   ```

3. Ran a temporary container to inspect the default layout. Tomcat ships the sample apps in `webapps.dist`, and `webapps` is empty. I copied the contents across so the sample apps work:

   ```bash
   docker run -it --rm tomcat:10.1-jdk21 bash
   cp -R webapps.dist/. webapps/
   ```

## Step 2: Create the Custom Dockerfile

Built a Dockerfile that starts from the Tomcat image, copies the sample apps, and adds the `.war` built by Jenkins.

```dockerfile
FROM tomcat:10.1-jdk21

# Restore the default sample apps from webapps.dist
RUN cp -R webapps.dist/. webapps/

# Deploy the application built by Jenkins
COPY hello-app.war /usr/local/tomcat/webapps/
```

Tomcat's official image installs to `/usr/local/tomcat`, so the `.war` goes to `/usr/local/tomcat/webapps/`.

## Step 3: Create a Deployment User and Folder

1. Created a user for deployments:

   ```bash
   sudo adduser dockeradmin
   sudo passwd dockeradmin
   ```

2. Added the user to the `docker` group so it can run Docker commands:

   ```bash
   sudo usermod -aG docker dockeradmin
   ```

3. Created the deployment folder and gave the user ownership:

   ```bash
   sudo mkdir -p /opt/docker
   sudo chown -R dockeradmin:dockeradmin /opt/docker
   ```

4. Placed the Dockerfile in `/opt/docker`. Jenkins will copy the `.war` into the same folder.

## Step 4: Install Publish Over SSH in Jenkins

1. Opened **Manage Jenkins → Plugins** and installed **Publish Over SSH**.
2. Opened **Manage Jenkins → System** and added the Docker server under **Publish over SSH**:
   - **Hostname:** Docker server's IP
   - **Username:** `dockeradmin`
   - **Password:** the `dockeradmin` password
3. Used the Jenkins job's **Post-build Actions → Send build artifacts over SSH** to copy `target/*.war` to `//opt//docker`. The double slashes are a common good practice in this field.

## Step 5: Automate Deployment with Shell Commands

In the same job, added an **Exec command** block to rebuild and restart the container:

```bash
# Stop and remove the running container
docker stop tomcat-app || true
docker rm tomcat-app || true

# Remove the old image
docker rmi tomcat-hello || true

# Build the new image from /opt/docker
cd //opt//docker
docker build -t tomcat-hello .

# Run the new container on port 8080
docker run -d --name tomcat-app -p 8080:8080 tomcat-hello
```

The `|| true` stops the job from failing on the first run, when there is no container or image to remove.

## Result

Each build now runs this flow:

1. Jenkins compiles the code and creates `hello-app.war`.
2. Jenkins copies the `.war` to `/opt/docker` on the Docker server.
3. The shell commands rebuild the image and restart the container.
4. The app is live at `http://<docker-server-IP>:8080/hello-app/hello`.

## Key Learnings

- Running Tomcat in a container and customizing its image with a Dockerfile.
- Automating file transfer and deployment from Jenkins with SSH.
- Managing a deployment user, file ownership, and Docker group permissions on Linux.
- Rebuilding and restarting containers as part of a CI/CD flow.

## Next Steps

- Replace the manual SSH password with an SSH key.
- Add a `Jenkinsfile` so the whole pipeline is defined as code.
- Use a `docker-compose.yml` file to manage the container.
- Push built images to a registry such as Docker Hub or Amazon ECR.
