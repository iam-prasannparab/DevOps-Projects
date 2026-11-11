# Project 1: Jenkins Build for a `.war` Artifact

A hands-on project where I set up a Jenkins CI server on AWS EC2 and used it to build a Java web application into a `.war` (Web Application Archive) file.

## Overview

| Item | Details |
|------|---------|
| Cloud | AWS EC2 |
| Instance type | `c7i-flex.large` |
| OS | Amazon Linux |
| Storage | 15 GB |
| CI tool | Jenkins |
| Build tool | Apache Maven |
| Runtime | Java 21 |
| Source control | Git / GitHub |
| Output | `.war` artifact |

## Architecture

```
Developer ──push──> GitHub repo
                        │
                        │ (Git plugin clones the repo)
                        ▼
              Jenkins on EC2 (c7i-flex.large)
                        │
                        │ Maven build (mvn package)
                        ▼
                 target/*.war artifact
```

## Step 1: Launch the EC2 Instance

1. Launched an EC2 instance using the `c7i-flex.large` type.
2. Selected an Amazon Linux image.
3. Attached 15 GB of storage.

## Step 2: Install Git

```bash
sudo dnf install git -y
```

## Step 3: Install Java 21

```bash
sudo dnf install java-21* -y
```

## Step 4: Install Maven

Downloaded Maven from the official Apache Maven website and extracted it on the server.

## Step 5: Install Jenkins

Installed Jenkins from the official Jenkins website, following the Amazon Linux instructions.

## Step 6: Configure Environment Variables

Added the Java and Maven paths to `~/.bash_profile`:

```bash
JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto.x86_64
M2_HOME=/opt/maven
M2=/opt/maven/bin

PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$M2:$M2_HOME
export PATH
```

Then reloaded the profile:

```bash
source ~/.bash_profile
java -version
mvn -version
```

## Step 7: Set Up the Jenkins Dashboard

1. Opened Jenkins in the browser (`http://<EC2-public-IP>:8080`) and completed the initial setup using the admin password from the server.
2. Installed the following plugins from **Manage Jenkins → Plugins**:
   - **GitHub** plugin
   - **Maven Integration** plugin
   - **Deploy to Container** plugin

## Step 8: Configure Tools in Jenkins

Under **Manage Jenkins → Tools**, added the installation paths:

- **JDK:** name `jdk21`, `JAVA_HOME` set to the Java 21 path
- **Maven:** name `maven3`, `MAVEN_HOME` set to the Maven path

## Step 9: Create a Sample Job

1. Created a new **Maven** project in Jenkins.
2. Under **Source Code Management**, selected Git and entered the GitHub repository URL.
3. Under **Build Steps**, added:
   ```bash
   mvn clean package
   ```
4. Saved the job and clicked **Build Now**.
5. Verified the build succeeded and the `.war` file was produced in the `target/` directory.

## Result

The Jenkins job successfully pulled the source code from GitHub, compiled it with Maven, and generated a `.war` artifact on every build.

## Key Learnings

- Installing and configuring Jenkins on a Linux server.
- Managing Java and Maven paths for CI tools.
- Using the Jenkins plugin ecosystem (Git, Maven, Deploy to Container).
- Building and packaging a Java application into a `.war` file automatically.

## Next Steps

- Add a `Jenkinsfile` to define the pipeline as code.
- Deploy the generated `.war` file to a Tomcat container.
- Add automatic builds using GitHub webhooks/Poll SCM.
