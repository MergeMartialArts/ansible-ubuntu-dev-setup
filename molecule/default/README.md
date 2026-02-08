# Molecule Tests for Docker Installation

This directory contains Molecule tests for the `install_docker.yml` playbook.

## Test Scenarios

The default scenario tests Docker installation on:
- Ubuntu 22.04 (Jammy)
- Ubuntu 24.04 (Noble)
- Debian 12 (Bookworm)
- Debian 13 (Trixie)

## What's Tested

The verification suite checks:

1. **Installation Verification**
   - Docker binary is installed and returns version
   - Docker Compose plugin is installed
   - All required packages (docker-ce, docker-ce-cli, containerd.io, docker-buildx-plugin, docker-compose-plugin)
   - Conflicting packages are removed (docker.io, podman-docker)

2. **Service Status**
   - Docker daemon is running (active state)
   - Docker service is enabled on boot

3. **Functionality Tests**
   - Docker info command works
   - Docker Buildx is functional
   - Docker group exists

## Running Tests

### Full Test Cycle
```bash
make molecule-test
```
This runs: destroy → create → converge → verify → destroy

### Individual Steps
```bash
# Create and configure instances
make molecule-converge

# Run verification tests only
make molecule-verify

# Clean up instances
make molecule-destroy
```

### Test All Platforms
```bash
make molecule-test-all
```

## Prerequisites

Install dev dependencies:
```bash
uv sync --dev
```

Docker must be available on the host machine (Molecule uses Docker driver).

## Directory Structure

```
molecule/default/
├── converge.yml      # Applies the install_docker playbook
├── molecule.yml      # Molecule configuration
├── prepare.yml       # Prepares test environment
├── verify.yml        # Verification tests
└── README.md         # This file
```
