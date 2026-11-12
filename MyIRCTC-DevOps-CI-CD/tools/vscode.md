# VS Code

## What it does
Code editor. Used to write and edit the application source, the Jenkinsfiles, playbooks, and documentation.

## Where it sits in the flow
Before the pipeline starts, on the developer's machine.

## What it receives and hands off
- **Receives:** the developer's typing and the local project files.
- **Hands off:** files saved to the local Git repository, which the developer then commits and pushes.

## Which stage calls it
- **None in the pipeline.** It is a development tool only.
