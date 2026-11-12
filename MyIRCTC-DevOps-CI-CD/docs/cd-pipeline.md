# CD Pipeline (`jenkins/Jenkinsfile-CD`)

Runs on the **Jenkins server**. It has one stage, `Deployment`, which runs over SSH on the Ansible server:

```bash
ansible-playbook -i /opt/docker/hosts /opt/docker/kube_deploy.yml
```

## Why CI and CD are separate

- CI produces a verified, published build (WAR, Artifactory entry, Docker image).
- CD deploys a release. It can be re-run or changed independently of the build.
- CD starts only after CI succeeds, through the `post { success }` block in `Jenkinsfile-CI`.

## Prerequisites

- Jenkins job named `Pipeline_RegApp_CD_Job` exists.
- SSH server `ansible-server` is configured in Jenkins.
- `/opt/docker/kube_deploy.yml` and `/opt/docker/hosts` exist on the Ansible server.
- The Ansible server has `kubectl` access to the target cluster.
