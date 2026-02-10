# ansible-ubuntu-dev-setup

Bootstrap an Ubuntu developer environment with Ansible. This repo is designed to be easy to clone and run on a fresh host, while still supporting a full development workflow via `uv`.

## Quick Start (run on a new Ubuntu host)
1. Install `uv` (if not already):

    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```

2. Install runtime dependencies:
    ```bash
    uv sync
    ```

3. Run the Docker installation playbook:
    ```bash
    uv run ansible-playbook -i localhost, -c local --ask-become-pass playbooks/install_docker.yml
    ```

## Development (uv workflow)
This repo uses `uv` for the development toolchain (Ansible, Molecule, linting).

1. Install `uv` (if not already):
    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```

2. Sync dev dependencies:
    ```bash
    uv sync --dev
    ```

3. Run lint or tests:
    ```bash
    uv run ansible-lint
    uv run molecule test
    ```

## Devcontainer (optional)
If you use VS Code, open the repo in the devcontainer for a preconfigured dev environment. The container keeps host setup minimal and still lets you use the `uv` workflow above.
