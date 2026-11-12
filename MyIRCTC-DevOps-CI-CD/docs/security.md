# Security

## Never commit

- Jenkins credentials or passwords
- JFrog access tokens
- Docker Hub passwords or tokens
- AWS access keys
- SSH private keys (`.pem`, `id_rsa`)
- Kubernetes Secrets or kubeconfig files
- Personal access tokens

## How credentials are handled

| Secret | Where it lives |
|---|---|
| Artifactory token | Jenkins Credentials Manager, ID `artifact-cred` |
| SSH key or password for Ansible server | Jenkins SSH server configuration (`ansible-server`) |
| Docker Hub login | Docker login on the Ansible server, or a Jenkins credential passed to the playbook |
| Kubernetes access | kubeconfig on the Ansible server, not in the repository |

## Recommendations

- Rotate tokens that were ever pasted into chat, logs, or screenshots.
- Use SSH keys instead of passwords for the Ansible server.
- Use a least-privilege IAM role for EKS access.
- Keep the `.gitignore` in this repository, and run a secret scanner (for example Gitleaks) before pushing.
