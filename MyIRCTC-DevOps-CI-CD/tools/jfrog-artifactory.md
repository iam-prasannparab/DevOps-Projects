# JFrog Artifactory

## What it does
Artifact repository. It stores the built WAR with version information and build details.

## Where it sits in the flow
Phase 2 (Jenkins CI), after SonarQube and before the Ansible step.

## What it receives and hands off
- **Receives:** `target/*.war`, uploaded with the `buildid` and `commitid` properties.
- **Hands off:** a stored, versioned artifact in `sai-libs-release-local`, plus build info that links the artifact to the Jenkins build.

## Which stage calls it
- **Artifact Publish** (Jenkins CI): `server.upload(uploadSpec)` uploads the WAR, and `server.publishBuildInfo(buildInfo)` records the build.
- Authentication uses the Jenkins credential `artifact-cred`.

Note: the Docker build does not pull the WAR from Artifactory. It uses the WAR sent over SSH.
