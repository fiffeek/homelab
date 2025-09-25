# Homelab

A personal homelab infrastructure managed with Ansible and Docker Compose.

## Overview

This repository contains the automation and configuration for managing a personal homelab environment. It uses Ansible for server provisioning and Docker Compose stacks for service deployment.

## Structure

- `services/apps/` - Ansible playbooks and service stacks
  - `playbooks/` - Ansible playbooks for server configuration
  - `stacks/` - Docker Compose service definitions
  - `roles/` - Ansible roles
- `bootstrap/` - Initial server setup and provisioning
- `ansible-common/` - Shared Ansible utilities

## Requirements

- `asdf`, the rest below will be pulled automatically:
  - Python 3.x
  - Node.js (for development tools)
  - Ansible

## Quick Start

1. Install dependencies:

   ```bash
   make dev
   ```

2. Deploy services from a specific stack:

   ```bash
   make service=llm hosts=black-cat.home service-deploy
   ```

3. Run initial provisioning:
   ```bash
   make provisioning
   ```

## Development

This project uses pre-commit hooks for code quality. The setup includes:

- Ansible Lint
- YAML formatting and validation
- Prettier for code formatting

Run `make dev` to set up the development environment with all necessary tools.
