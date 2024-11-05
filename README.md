# Adobe Launch Extensions Collection

This repository serves as a central hub for my Adobe Launch extensions. Each extension is maintained as a separate repository and included here as a git submodule.

## Repository Structure

```
launch-extensions/
├── .github/
│   └── workflows/
│       └── validate-submodules.yml
├── scripts/
│   ├── init-submodules.sh
│   └── update-submodules.sh
├── extensions/
│   ├── analytics-extension/
│   ├── target-extension/
│   └── core-extension/
├── docs/
│   ├── CONTRIBUTING.md
│   └── DEVELOPMENT.md
├── .gitmodules
└── README.md
```

## Getting Started

1. Clone this repository:
```bash
git clone https://github.com/tyssejc/launch-extensions.git
cd launch-extensions
```

2. Initialize and update submodules:
```bash
# Using provided script
./scripts/init-submodules.sh

# Or manually
git submodule init
git submodule update --recursive
```

## Adding a New Extension

1. Create a new repository for your extension
2. Add it as a submodule:
```bash
git submodule add https://github.com/tyssejc/extension-name.git extensions/extension-name
git commit -m "feat: add extension-name submodule"
```

## Updating Extensions

To update all submodules to their latest versions:
```bash
./scripts/update-submodules.sh
```

## Contributing

Please see the [Contributing Guide](docs/CONTRIBUTING.md) for details on our development process and how to submit changes.

## Extensions

| Extension | Description | Version |
|-----------|-------------|---------|
| [analytics-extension](extensions/analytics-extension) | Adobe Analytics extension | 1.0.0 |
| [target-extension](extensions/target-extension) | Adobe Target extension | 1.0.0 |
| [core-extension](extensions/core-extension) | Core functionality extension | 1.0.0 |

## License

This project is licensed under the MIT License - see the LICENSE file for details.