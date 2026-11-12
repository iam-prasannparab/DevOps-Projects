# SonarQube

## What it does
Static code analysis. It checks the code for bugs, code smells, duplication, and quality issues, and shows the results in a dashboard.

## Where it sits in the flow
Phase 2 (Jenkins CI), after the Test stage and before the WAR is published to Artifactory.

## What it receives and hands off
- **Receives:** the source code and compiled classes, sent by the Maven scanner.
- **Hands off:** an analysis report on the SonarQube dashboard.

## Which stage calls it
- **QA** (Jenkins CI): `withSonarQubeEnv('saidemy-sonarqube-server')` runs `sonar-maven-plugin:sonar` with the project key `saidemydevopskey_saidemyproject`.

Note: the pipeline does not include a `waitForQualityGate` step, so a failing quality gate does not stop the pipeline. Add that step if you want the gate to block the build.
