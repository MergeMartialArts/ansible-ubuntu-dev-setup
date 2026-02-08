# GitHub Copilot Instructions

## Commit Message Guidelines

Always use [Conventional Commits](https://www.conventionalcommits.org/) format for all commit messages.

### Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **build**: Changes that affect the build system or external dependencies
- **ci**: Changes to CI configuration files and scripts
- **chore**: Other changes that don't modify src or test files

### Examples

```
feat: add Docker installation playbook
fix: correct systemd service configuration
docs: update README with installation instructions
test: add molecule tests for all supported platforms
ci: configure GitHub Actions workflow
refactor: simplify apt repository configuration
```

### Rules

- Use lowercase for type and description
- Keep the description concise (50 characters or less preferred)
- Use imperative mood ("add" not "added" or "adds")
- No period at the end of the description
- Add body for additional context if needed
- Reference issues in the footer (e.g., "Closes #123")
