# Tools

One file per tool. Each explains what the tool does, where it sits in the flow, what it receives and hands off, and which pipeline stage calls it.

| Tool | Stage | Status |
|---|---|---|
| [Git](git.md) | Source control | Implemented |
| [GitHub](github.md) | Source control, webhook | Implemented |
| [Java](java.md) | Build runtime | Implemented |
| [Maven](maven.md) | Build, test, WAR | Implemented |
| [Jenkins](jenkins.md) | CI/CD orchestration | Implemented |
| [SonarQube](sonarqube.md) | Code quality (QA) | Implemented |
| [JFrog Artifactory](jfrog-artifactory.md) | Artifact storage | Implemented |
| [Ansible](ansible.md) | Image build, deployment | Implemented (playbooks not supplied) |
| [Docker](docker.md) | Image build | Implemented (playbook not supplied) |
| [Docker Hub](docker-hub.md) | Image registry | Implemented (playbook not supplied) |
| [Apache Tomcat](tomcat.md) | Runs the WAR in the container | Implemented (via Dockerfile) |
| [Kubernetes](kubernetes.md) | Runtime orchestration | Planned |
| [Helm](helm.md) | Kubernetes packaging | Not implemented |
| [AWS EKS](aws-eks.md) | Managed Kubernetes | Planned |
| [Route 53](route-53.md) | DNS | Planned |
| [Prometheus](prometheus.md) | Metrics collection | Planned |
| [Grafana](grafana.md) | Dashboards | Planned |
| [Terraform](terraform.md) | AWS infrastructure as code | Not implemented |
| [AWS](aws.md) | Cloud provider | Implemented for EKS, planned for the rest |
| [VS Code](vscode.md) | Development IDE | Used for editing only |
