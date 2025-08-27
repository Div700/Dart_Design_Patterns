# Chrome Browser Decorator Pattern - Dart Implementation

A simple implementation of the Decorator design pattern using a Chrome browser customization system built in Dart.

## Overview

This project demonstrates the Decorator pattern by showing how browser features like styles and extensions can be dynamically added to a base Chrome browser without modifying the original browser class. Each decorator wraps the browser and adds new functionality while maintaining the same interface.

## Pattern Components

- **Browser Interface**: Defines the basic browser operations
- **GoogleChrome (Concrete Component)**: The base browser implementation
- **BrowserDecorator (Base Decorator)**: Abstract decorator class
- **StyleDecorator**: Adds visual customizations to the browser
- **ExtensionsDecorator**: Adds browser extensions with access controls
- **Extension Model**: Represents browser extensions with permissions

## Project Structure

```
lib/
├── components/
│   └── browser.dart              # Browser interface
├── browsers/
│   └── google_chrome.dart        # Base Chrome implementation
├── decorators/
│   ├── browser_decorator.dart    # Base decorator class
│   ├── style_decorator.dart      # Style customization decorator
│   └── extensions_decorator.dart # Extensions management decorator
└── models/
    └── extension.dart            # Extension data model

example/
└── main.dart                     # Demo application
```

## Key Features

- **Dynamic Enhancement**: Add features to browsers without modifying core classes
- **Chainable Decorators**: Multiple decorators can be combined in any order
- **Style Customization**: Add themes, fonts, and visual modifications
- **Extension Management**: Install extensions with configurable access permissions
- **Flexible Architecture**: Easy to add new types of decorators

## Decorator Types

### Style Decorator
- **Purpose**: Adds visual customizations to the browser
- **Features**: Themes, fonts, layout modifications
- **Example**: Dark theme, custom fonts, rounded corners

### Extensions Decorator
- **Purpose**: Manages browser extensions and their permissions
- **Features**: Install extensions, control browser access
- **Example**: AdBlock, password managers, productivity tools

## How It Works

1. **Base Browser**: Start with a basic GoogleChrome instance
2. **Add Styles**: Wrap with StyleDecorator to add visual customizations
3. **Add Extensions**: Wrap with ExtensionsDecorator to install extensions
4. **Chain Decorators**: Combine multiple decorators in any order
5. **Render Browser**: Display the fully decorated browser with all features

## Running the Demo

```bash
dart run example/main.dart
```

## Sample Output

```
=== CHROME BROWSER DECORATOR PATTERN ===

Starting Google Chrome
Google search engine is present

--- ADDING STYLES ---
Added style: Dark Theme
Added style: Custom Fonts

--- FINAL CHROME BROWSER ---
-------------------------------------------
Main Chrome Browser
Styles in your customized Chrome profile:
  - Dark Theme
  - Custom Fonts
Extensions running in background:
Extension AdBlock Plus with browser access
Extension Password Manager with browser access
-------------------------------------------
```

## Benefits of Decorator Pattern

- **Open/Closed Principle**: Open for extension, closed for modification
- **Single Responsibility**: Each decorator has one specific purpose
- **Runtime Composition**: Features can be added dynamically at runtime
- **Flexible Combinations**: Decorators can be mixed and matched
- **No Class Explosion**: Avoid creating many subclasses for feature combinations

## Real-World Applications

This pattern is used in:
- **Browser Customization**: Chrome extensions and themes
- **UI Components**: Adding features to GUI elements
- **File Systems**: Compression, encryption layers
- **Network Protocols**: Adding security, logging layers
- **Text Processing**: Adding formatting, validation features

## Extension Model

Each extension includes:
- **Name**: Identifier for the extension
- **Access Permission**: Whether extension can access browser APIs
- **Background Execution**: Runtime behavior based on permissions

## Design Pattern Category

**Structural Pattern** - Deals with object composition and relationships between objects to form larger structures.

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Run the demo:
   ```bash
   dart run example/main.dart
   ```

## Requirements

- Dart SDK 2.17.0 or higher

## License

This project is for educational purposes to demonstrate the Decorator design pattern.