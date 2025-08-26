# Template Method Design Pattern

## Overview

The **Template Method** is a behavioral design pattern that defines the skeleton of an algorithm in a base class, letting subclasses override specific steps of the algorithm without changing its overall structure.

## Intent

- Define the skeleton of an algorithm in an operation, deferring some steps to subclasses
- Let subclasses redefine certain steps of an algorithm without changing the algorithm's structure
- Promote code reuse by extracting common functionality into a base class
- Implement the "Hollywood Principle": "Don't call us, we'll call you"

## Problem Solved

When you have multiple classes that implement similar algorithms with slight variations, you often end up with code duplication. The Template Method pattern solves this by:

1. **Eliminating code duplication** - Common steps are implemented once in the base class
2. **Providing a consistent algorithm structure** - All implementations follow the same sequence
3. **Enabling easy extension** - New implementations only need to override specific steps
4. **Enforcing algorithm contracts** - The template method ensures all steps are executed in the correct order

## Structure

```
AbstractClass (SoftwareInstallerBase)
├── templateMethod() - Defines the algorithm skeleton
├── abstractOperation1() - Must be implemented by subclasses
├── abstractOperation2() - Must be implemented by subclasses
└── hook() - Optional methods that can be overridden

ConcreteClass1 (LinuxInstaller)
├── abstractOperation1() - Linux-specific implementation
└── abstractOperation2() - Linux-specific implementation

ConcreteClass2 (MacOSInstaller)
├── abstractOperation1() - macOS-specific implementation
└── abstractOperation2() - macOS-specific implementation

ConcreteClass3 (WindowsInstaller)
├── abstractOperation1() - Windows-specific implementation
└── abstractOperation2() - Windows-specific implementation
```

## Implementation Details

### Core Components

1. **Abstract Template Class**: `SoftwareInstallerBase`
   - Contains the template method `install()` that defines the algorithm structure
   - Declares abstract methods that subclasses must implement
   - Handles common logic like error handling and result tracking

2. **Concrete Implementations**: Platform-specific installers
   - `LinuxInstaller` - Handles .deb packages and apt-style installation
   - `MacOSInstaller` - Handles .dmg files and Application folder installation
   - `WindowsInstaller` - Handles .exe installers and registry operations

3. **Data Model**: `InstallationResult`
   - Tracks the progress and results of each installation step
   - Provides detailed reporting and error handling

### Algorithm Steps

The template method `install()` defines this three-step algorithm:

1. **Download**: Platform-specific software download
2. **Install**: Platform-specific installation process
3. **Verify**: Platform-specific verification of successful installation

## Usage Example

```dart
// Client selects appropriate installer based on platform
SoftwareInstallerBase installer = LinuxInstaller();

// Template method executes the algorithm
InstallationResult result = installer.install("VSCode");

// Result contains detailed information about each step
print(result.toString());
```

## Benefits

### ✅ Advantages

1. **Code Reuse**: Common algorithm structure is implemented once
2. **Consistency**: All implementations follow the same pattern
3. **Maintainability**: Changes to the algorithm structure only need to be made in one place
4. **Extensibility**: Easy to add new platform implementations
5. **Inversion of Control**: The base class controls when and how steps are executed

### ⚠️ Considerations

1. **Inheritance Limitation**: Requires inheritance, which can be limiting in some cases
2. **Complexity**: Can make the code more complex for simple algorithms
3. **Debugging**: The control flow jumps between base and derived classes

## When to Use

### ✅ Use Template Method When:

- You have multiple classes with similar algorithms that differ only in specific steps
- You want to control the overall algorithm flow while allowing customization of individual steps
- You need to avoid code duplication in similar algorithms
- You want to provide a framework that others can extend with specific implementations

### ❌ Avoid Template Method When:

- The algorithm steps are completely different between implementations
- You need more flexibility than inheritance provides (consider Strategy pattern)
- The algorithm is simple and unlikely to change
- You prefer composition over inheritance

## Real-World Applications

1. **Framework Development**: Web frameworks often use template methods for request processing
2. **Data Processing**: ETL pipelines with consistent extract-transform-load steps
3. **Game Development**: Game loops with consistent update-render cycles
4. **Testing Frameworks**: Test execution with setup-execute-teardown phases
5. **Compilers**: Parsing and compilation phases with language-specific implementations

## Related Patterns

- **Strategy Pattern**: Use when you need to change algorithms at runtime
- **Factory Method**: Often used together - factory methods can be called from template methods
- **Command Pattern**: Commands can implement template methods for consistent execution

## File Structure

```
template/
├── README.md                          # This documentation
├── main.dart                          # Client code and demonstration
├── interfaces/
│   └── software_installer.dart        # Abstract template class
├── models/
│   └── installation_result.dart       # Data model for tracking results
└── concrete_installers/
    ├── linux_installer.dart           # Linux-specific implementation
    ├── macos_installer.dart           # macOS-specific implementation
    └── windows_installer.dart         # Windows-specific implementation
```

## Running the Example

1. Navigate to the template directory
2. Run the main file:
   ```bash
   dart run main.dart
   ```
3. Select your platform (1-3)
4. Enter software names to "install"
5. Observe how each platform handles the same algorithm differently

## Key Takeaways

The Template Method pattern is excellent for:
- **Standardizing workflows** while allowing customization
- **Reducing code duplication** in similar algorithms
- **Providing frameworks** that others can extend
- **Enforcing consistent behavior** across different implementations

This implementation demonstrates a practical use case where different operating systems require different installation procedures, but the overall process (download → install → verify) remains consistent across all platforms.
