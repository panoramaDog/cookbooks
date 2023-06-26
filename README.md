# Cookbooks

## Table of contents

- Overview
- To Do
- Credits
- Support
- Current Maintainers

## Overview

This repo contains all of my homelab cookbooks, from ansible roles and docker-compose files to (shitty) kubernetes manifests and personal userscripts.

## To Do

- [x] mkdir task for /opt kuma
- [ ] create new role `baseline` to ensure baseline packages are installed on servers bc not having them is annoying
- [ ] double check documentation for netbox and uptime kuma roles
- [ ] create documentation for twingate role
- [ ] convert docker compose files into ansible deployable in docker_compose folder

## Project Ideas

- [ ] Wireguard-based VPN ansible role (tailscale/twingate)
- [ ] Write common role in ansible
- [ ] Ansible Semaphore
- [ ] Media automation
- [ ] Refactor code (mainly readme's)
- [ ] Install pre-commit
  - [ ] Create github pipeline for linting
  - [ ] Create github pipeline for tests/CI deployment
- [ ] Gitea Actions
- [ ] FreshRSS / Miniflux
- [ ] Jenkins
- [ ] Write K8s role for automated installation on ubuntu hosts
  - [ ] Add netdata role dependency to K8s VMs and ansible role
- [ ] Hashicorp vault
- [ ] Hashicorp packer
- [ ] Terraform to automatically provision infrastructure
- [ ] Look into dev containers

## Credits

## Support

If you are testing containers and create "development" containers with the default usernames, passwords, and configurations, you will need to completely remove the images once you are ready to create production containers with properly secure usernames, passwords, and configurations.

Run `docker-compose down -v` from the directory your `docker-compose.yml` file is located in to shut down the docker containers and destroy the container data. The volumes outside the container mapped to the host will be safe - don't worry about data loss. Then, run `docker-compose up --build` to rebuild the containers with the proper passwords and configuration.

## Current Maintainers

- [spicyFajitas](https://github.com/spicyFajitas)
