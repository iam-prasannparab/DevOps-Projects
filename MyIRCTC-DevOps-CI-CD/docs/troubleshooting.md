# Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| `mvn: command not found` in Build | Maven tool name mismatch | Check the `maven` name in Jenkinsfile matches Manage Jenkins → Tools |
| No `target/*.war` after Build | Packaging type is not `war`, or build failed | Check `pom.xml` `<packaging>war</packaging>` and the Build log |
| Sonar stage fails to connect | Wrong server name in `withSonarQubeEnv` | Match the name in Manage Jenkins → System |
| Artifactory upload 401/403 | Invalid or expired `artifact-cred` | Regenerate the token and update the Jenkins credential |
| SSH Publisher "Failed to connect" | Wrong host, user, or key for `ansible-server` | Test the SSH login from the Jenkins server |
| `ansible-playbook: not found` on Ansible server | Ansible not installed or not on the SSH user's PATH | Install Ansible; check PATH in the SSH session |
| Playbook file not found | Playbooks not copied to `/opt/docker` | Copy `create_image_regapp.yml` and `kube_deploy.yml` there |
| Docker push denied | Not logged in to Docker Hub | Run `docker login` as the SSH user on the Ansible server |
| CD job does not start | CI failed, or the CD job name differs | Check the CI result and the job name `Pipeline_RegApp_CD_Job` |
| Pods in `ImagePullBackOff` | Image tag not found in Docker Hub, or private repo without a pull secret | Verify the tag exists and create an image pull secret if needed |
