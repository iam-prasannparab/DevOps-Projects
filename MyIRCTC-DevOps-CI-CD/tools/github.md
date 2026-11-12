# GitHub

## What it does
Hosts the Git repository and sends webhook events to Jenkins when code is pushed.

## Where it sits in the flow
Phase 1, between the developer and Jenkins. It is the central source of truth for the code.

## What it receives and hands off
- **Receives:** pushes from the developer's Git client.
- **Hands off:** a webhook event that starts the CI job, and the source code when Jenkins clones it.

## Which stage calls it
- **Checkout** (Jenkins CI): Jenkins clones `https://github.com/SaiDevOpsFaculty/myirctc.git`, branch `main`.
- **Webhook**: starts the CI job on push. Configure this in the GitHub repo settings.
