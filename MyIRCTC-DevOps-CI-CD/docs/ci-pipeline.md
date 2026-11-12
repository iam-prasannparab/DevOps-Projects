# CI Pipeline (`jenkins/Jenkinsfile-CI`)

Runs on the **Jenkins server**. Triggered by a GitHub push, and it starts the CD job on success.

| Stage | What it does | Where |
|---|---|---|
| Checkout | Clones `main` from the GitHub repository | Jenkins |
| Build | `mvn clean package -DskipTests` creates `target/*.war` | Jenkins |
| Test | `mvn test` runs unit tests | Jenkins |
| QA | Runs the SonarQube Maven scanner on the `saidemy-sonarqube-server` configuration | Jenkins → SonarQube |
| Artifact Publish | Uploads `target/*.war` to JFrog Artifactory (`sai-libs-release-local`) with build ID and commit ID as properties, then publishes build info | Jenkins → Artifactory |
| Docker Image with Artifact | SSH Publisher copies the WAR to `/opt/docker` on the Ansible server and runs `create_image_regapp.yml` | Jenkins → Ansible server |
| post success | Starts `Pipeline_RegApp_CD_Job` | Jenkins |

## Notes

- **Build order:** `-DskipTests` in the Build stage means tests run in the separate Test stage afterwards. Packaging therefore happens before tests. Consider removing `-DskipTests` from Build so the WAR is only produced after tests pass.
- **Credentials:** `artifact-cred` is a Jenkins credential ID. Do not put the token in the Jenkinsfile.
- **Tool names:** `M2_HOME` and `saidemy-sonarqube-server` must match names configured in Jenkins.
- **Artifact source:** The Docker build uses the WAR sent over SSH, not the copy in Artifactory.
