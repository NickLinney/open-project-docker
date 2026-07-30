# Disaster Recovery

## Recovery Goal

A fresh operator should be able to reconstruct the runtime from:

- repository contents
- a valid `.env`
- persistent data or backup artifacts

## Recovery Inputs

- compose definitions
- operational scripts
- versioned documentation
- database backups
- persistent asset data

## Recovery Principle

If the containers are lost but the repository, configuration, and backups remain, the deployment should be recoverable.
