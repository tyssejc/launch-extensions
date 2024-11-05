# Adobe Launch Extensions Development Guide

This guide provides detailed information about developing Adobe Launch extensions within this repository collection.

## Table of Contents
1. [Extension Architecture](#extension-architecture)
2. [Development Environment](#development-environment)
3. [Extension Components](#extension-components)
4. [Testing Strategy](#testing-strategy)
5. [Performance Considerations](#performance-considerations)
6. [Security Guidelines](#security-guidelines)
7. [Publishing Process](#publishing-process)

## Extension Architecture

### Basic Structure
Each extension should follow this basic structure:
```
extension-name/
├── src/
│   ├── lib/           # Shared utilities
│   ├── actions/       # Action types
│   ├── events/        # Event types
│   ├── conditions/    # Condition types
│   ├── data-elements/ # Data element types
│   └── view/          # Configuration views
├── tests/
└── extension.json
```

### Key Files Explained
- `extension.json`: Defines extension metadata, components, and configuration
- `src/lib/`: Shared code and utilities
- `src/actions/`: Implementation of action types
- `src/events/`: Implementation of event types
- `src/conditions/`: Implementation of condition types
- `src/data-elements/`: Implementation of data element types
- `src/view/`: React components for configuration interfaces

## Development Environment

### Required Tools
- Node.js (LTS version)
- npm or yarn
- Adobe Launch Sandbox
- Modern web browser
- Code editor with ESLint support

### Setting Up Your Environment

1. Install Adobe Launch CLI:
```bash
npm install -g @adobe/reactor-cli
```

2. Initialize a new extension:
```bash
npx @adobe/reactor-scaffold
```

3. Set up development tools:
```bash
npm install --save-dev @adobe/reactor-sandbox @adobe/reactor-packager @adobe/reactor-typescript
```

### Development Workflow

1. Start the sandbox:
```bash
npm run sandbox
```

2. Make changes to your extension
3. Test in the sandbox environment
4. Build for production:
```bash
npm run build
```

## Extension Components

### Actions
Actions execute specific tasks when rules are triggered.

```javascript
module.exports = function(settings) {
  return {
    name: 'My Action',
    settings: settings,
    execute: function() {
      // Implementation
    }
  };
};
```

### Events
Events determine when rules should be triggered.

```javascript
module.exports = function(settings) {
  return {
    name: 'My Event',
    settings: settings,
    trigger: function(trigger) {
      // Implementation
    }
  };
};
```

### Data Elements
Data elements are variables that can be reused across rules.

```javascript
module.exports = function(settings) {
  return {
    name: 'My Data Element',
    settings: settings,
    getValue: function() {
      // Implementation
    }
  };
};
```

### Configuration Views
Views are React components that provide UI for configuring components.

```jsx
import React from 'react';

export default function ConfigView({ initInfo }) {
  return (
    <div>
      {/* Configuration UI */}
    </div>
  );
}
```

## Testing Strategy

### Unit Testing
Use Jest for unit testing components:

```javascript
describe('MyAction', () => {
  it('should execute correctly', () => {
    const action = require('../src/actions/myAction');
    // Test implementation
  });
});
```

### Integration Testing
Test your extension in the sandbox environment:

1. Create test rules
2. Verify execution
3. Check browser console
4. Validate data collection

### Performance Testing
- Measure execution time
- Monitor memory usage
- Test with different rule combinations
- Verify async operations

## Performance Considerations

### Best Practices
1. Minimize DOM operations
2. Use efficient selectors
3. Batch operations when possible
4. Cache frequently used values
5. Use debouncing/throttling for frequent events

### Code Example
```javascript
// Good: Efficient event handling
let timeout;
window.addEventListener('scroll', () => {
  if (timeout) {
    window.cancelAnimationFrame(timeout);
  }
  timeout = window.requestAnimationFrame(() => {
    // Handle scroll event
  });
}, { passive: true });
```

## Security Guidelines

### Data Handling
1. Never store sensitive data
2. Use secure transmission methods
3. Validate all inputs
4. Sanitize data before DOM insertion

### Code Security
```javascript
// Good: Input validation
function processUserInput(input) {
  if (typeof input !== 'string') {
    throw new Error('Invalid input type');
  }
  return input.trim();
}
```

## Publishing Process

### Pre-Release Checklist
1. Version number updated
2. CHANGELOG.md updated
3. All tests passing
4. Documentation updated
5. Build successful
6. Security scan completed

### Publishing Steps
1. Package the extension:
```bash
npx @adobe/reactor-packager
```

2. Validate the package:
```bash
npx @adobe/reactor-validator
```

3. Upload to Adobe Exchange:
```bash
npx @adobe/reactor-uploader
```

### Post-Release
1. Tag the release
2. Update documentation
3. Notify stakeholders
4. Monitor for issues

## Troubleshooting

### Common Issues
1. Sandbox not starting
   - Check Node.js version
   - Verify dependencies
   - Clear npm cache

2. Build failures
   - Check syntax errors
   - Verify dependencies
   - Check webpack configuration

3. Runtime errors
   - Check browser console
   - Verify rule configurations
   - Test in multiple browsers

### Debugging Tips
1. Use Launch debug mode
2. Enable verbose logging
3. Use browser developer tools
4. Check network requests
5. Validate data element values

## Resources
- [Adobe Launch Documentation](https://developer.adobe.com/client-sdks/documentation/launch/)
- [React Documentation](https://reactjs.org/)
- [Extension API Reference](https://developer.adobe.com/client-sdks/documentation/launch/extensions/)