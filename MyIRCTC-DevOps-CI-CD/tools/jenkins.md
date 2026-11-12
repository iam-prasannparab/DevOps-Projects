# Jenkins

## What it does
CI/CD orchestrator. It runs the pipeline stages, stores credentials, and chains the CI and CD jobs.

## Where it sits in the flow
At the centre of the whole flow. It starts from GitHub, runs the CI stages, sends the WAR to Ansible, and starts the CD job.

## What it receives and hands off
- **Receives:** the webhook from GitHub, and the repository code.
- **Hands off:** the WAR to Artifactory, the WAR and commands to the Ansible server over SSH, and a trigger to `Pipeline_RegApp_CD_Job`.

## Which stage calls it
Jenkins runs every stage. The stages call the tools in this order:
1. Checkout → Git and GitHub
2. Build and Test → Maven and Java
3. QA → SonarQube
4. Artifact Publish → Artifactory
5. Docker Image with Artifact → SSH Publisher → Ansible
6. post success → starts the CD job
7. CD Deployment → SSH Publisher → Ansible (`kube_deploy.yml`)
