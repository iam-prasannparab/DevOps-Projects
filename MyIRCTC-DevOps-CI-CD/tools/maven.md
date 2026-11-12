# Maven

## What it does
Build tool. It compiles the code, runs unit tests, and packages the application into a WAR file. Dependencies are declared in `pom.xml`.

## Where it sits in the flow
Phase 2 (Jenkins CI), after checkout and before SonarQube and Artifactory. The WAR it produces is the main build output.

## What it receives and hands off
- **Receives:** source code and `pom.xml` from the Checkout stage.
- **Hands off:** `target/*.war` for SonarQube analysis, Artifactory upload, and the SSH transfer to the Ansible server.

## Which stage calls it
- **Build**: `mvn clean package -DskipTests` creates the WAR.
- **Test**: `mvn test` runs unit tests.
- **QA**: the SonarQube Maven plugin runs `sonar:sonar`.
- **Tool setup**: the `maven 'M2_HOME'` block in the Jenkinsfile selects the installation.
