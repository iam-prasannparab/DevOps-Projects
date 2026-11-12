# Git

## What it does
Tracks changes to the source code and records each change as a commit.

## Where it sits in the flow
Phase 1, the very start. The developer commits locally, then pushes to GitHub.

## What it receives and hands off
- **Receives:** the developer's source files.
- **Hands off:** commits pushed to the `main` branch of GitHub.

## Which stage calls it
- **Checkout** (Jenkins CI): `git branch: 'main'` clones the repository.
- **Artifact Publish** (Jenkins CI): the `GIT_COMMIT` value is stored as the `commitid` property.
