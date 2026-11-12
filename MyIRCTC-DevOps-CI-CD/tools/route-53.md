# AWS Route 53

**Status: planned.** No DNS configuration is included in the supplied files.

## What it does
DNS service. It maps a domain name to the application's Load Balancer.

## Where it sits in the flow
Phase 5, at the edge. It is the first point users reach, before the Load Balancer.

## What it receives and hands off
- **Receives:** DNS queries from users' browsers.
- **Hands off:** the Load Balancer address for the domain.

## Which stage calls it
- **None in the pipeline.** You configure it once in the AWS console, with a record that points to the Load Balancer.
