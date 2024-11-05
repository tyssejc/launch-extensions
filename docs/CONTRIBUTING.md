# Contributing to Launch Extensions

Thank you for your interest in contributing to our Adobe Launch extensions! This document outlines the process and guidelines for contributing to any extension in this collection.

## Table of Contents
1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [Development Process](#development-process)
4. [Submitting Changes](#submitting-changes)
5. [Extension Guidelines](#extension-guidelines)
6. [Release Process](#release-process)

## Code of Conduct

This project adheres to a Code of Conduct that all contributors are expected to follow. Please read [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md) before contributing.

## Getting Started

### Prerequisites
- Node.js (LTS version)
- Git
- Adobe Launch (Developer) account
- @adobe/reactor-cli installed globally (`npm install -g @adobe/reactor-cli`)

### Setting Up Your Development Environment

1. Clone the meta-repository:
```bash
git clone https://github.com/your-org/launch-extensions.git
cd launch-extensions
```

2. Initialize submodules:
```bash
./scripts/init-submodules.sh
```

3. Choose the extension you want to work on:
```bash
cd extensions/[extension-name]
npm install
```

## Development Process

### Branch Naming Convention
- Feature branches: `feat/description`
- Bug fixes: `fix/description`
- Documentation: `docs/description`
- Maintenance: `chore/description`

### Commit Message Format
We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `chore`: Maintenance tasks
- `test`: Adding or updating tests
- `refactor`: Code changes that neither fix a bug nor add a feature

### Local Testing
1. Build the extension:
```bash
npm run build
```

2. Test using the sandbox:
```bash
npm run sandbox
```

3. Run unit tests:
```bash
npm test
```

## Submitting Changes

### Pull Request Process

1. Update your local repository:
```bash
git checkout main
git pull origin main
```

2. Create a new branch:
```bash
git checkout -b feat/your-feature-name
```

3. Make your changes, following our [coding standards](#coding-standards)

4. Commit your changes:
```bash
git commit -m "feat: add new feature"
```

5. Push to your fork:
```bash
git push origin feat/your-feature-name
```

6. Open a Pull Request on GitHub

### Pull Request Template
Your PR description should include:
- Clear description of the changes
- Link to related issue(s)
- Screenshots/GIFs for UI changes
- Steps to test the changes
- Checklist of completed items

## Extension Guidelines

### Coding Standards
- Use ES6+ features
- Follow ESLint configuration
- Write JSDoc comments for public methods
- Maintain 80% or higher test coverage

### Extension Structure
```
extension-name/
├── src/
│   ├── lib/
│   ├── view/
│   └── index.js
├── tests/
├── .eslintrc
├── package.json
└── extension.json
```

### Required Files
- `extension.json`: Extension configuration
- `README.md`: Extension documentation
- `CHANGELOG.md`: Version history
- `package.json`: Dependencies and scripts
- `src/index.js`: Main entry point

## Release Process

1. Update version in `extension.json` and `package.json`
2. Update CHANGELOG.md
3. Create a release PR
4. After merge, tag the release:
```bash
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

5. Package the extension:
```bash
npx @adobe/reactor-packager
```

6. Upload to Adobe Exchange:
```bash
npx @adobe/reactor-uploader
```

### Versioning
We follow [Semantic Versioning](https://semver.org/):
- MAJOR: Incompatible API changes
- MINOR: Backwards-compatible functionality
- PATCH: Backwards-compatible bug fixes

## Need Help?
- Check our [Documentation](./docs/)
- Open an issue
- Reach out to me on [Measure Slack](https://measure.slack.com/)

Thank you for contributing to our Launch extensions!