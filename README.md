# 🎯 Dart Design Patterns

[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/yourusername/Dart_Design_Patterns?style=social)](https://github.com/yourusername/Dart_Design_Patterns)

A comprehensive implementation of classic **Gang of Four (GoF) Design Patterns** in **Dart programming language**. This repository demonstrates the practical application of design patterns through real-world examples and interactive console applications.

## 📖 Table of Contents

- [Overview](#overview)
- [Implemented Patterns](#implemented-patterns)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [Pattern Examples](#pattern-examples)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Usage Examples](#usage-examples)
- [Learning Path](#learning-path)
- [Contributing](#contributing)
- [License](#license)

## 🚀 Overview

This project implements **11 essential design patterns** from the famous Gang of Four book, organized into two main categories:

- **5 Creational Patterns**: Focus on object creation mechanisms
- **6 Structural Patterns**: Deal with object composition and relationships

### ✨ What Makes This Repository Special

- 📚 **Real-world examples**: Each pattern solves actual programming problems
- 🎮 **Interactive demos**: Console applications you can run and explore
- 📖 **Extensive documentation**: Clear explanations and code comments
- 🧪 **Practical scenarios**: Network management, game development, UI frameworks
- 🎯 **Learning-focused**: Perfect for students and professionals

## 🏗️ Implemented Patterns

### 🎨 Creational Patterns

| Pattern | Implementation | Real-World Use Case |
|---------|---------------|-------------------|
| [**Abstract Factory**](Creational/AbstractFactory/) | UI Component Factory | Cross-platform UI elements (Windows/Linux) |
| [**Builder**](Creational/Builder/) | Mario Level Builder | Complex game level construction |
| [**Factory Method**](Creational/FactoryDesign/) | Quiz Sheet Creator | Dynamic quiz generation by subject |
| [**Prototype**](Creational/Prototype/) | Team Structure Cloner | Cloning organizational structures |
| [**Singleton**](Creational/Singleton/) | Database Manager | Single instance resource management |

### 🏢 Structural Patterns

| Pattern | Implementation | Real-World Use Case |
|---------|---------------|-------------------|
| [**Adapter**](Structural/Adapter/) | Network Router Interface | Multi-vendor network device integration |
| [**Bridge**](Structural/Bridge/) | AI Task Executor | AI models with task abstraction |
| [**Composite**](Structural/Composite/) | Question Hierarchy | Nested question containers |
| [**Facade**](Structural/Facade/) | Game Engine Interface | Simplified game subsystem access |
| [**Flyweight**](Structural/Flyweight/) | Map Icon Renderer | Memory-efficient icon sharing |
| [**Proxy**](Structural/Proxy/) | 3D Model Loader | Lazy loading of expensive resources |

## ⚡ Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/Dart_Design_Patterns.git

# Navigate to the project
cd Dart_Design_Patterns

# Try the Adapter pattern (Network Monitoring)
cd Structural/Adapter
dart pub get
dart run main.dart

# Try the Builder pattern (Mario Levels)
cd ../../Creational/Builder
dart run game_runner.dart
```

## 📁 Project Structure

```
Dart_Design_Patterns/
├── 🎨 Creational/
│   ├── AbstractFactory/           # Cross-platform UI components
│   │   ├── Client.dart           # Demo application
│   │   ├── Factories/            # Concrete factories
│   │   ├── interfaces/           # Abstract interfaces
│   │   └── Products/             # Concrete products
│   ├── Builder/                  # Mario level construction
│   │   ├── game_runner.dart      # Main demo
│   │   ├── builders/             # Concrete builders
│   │   └── product/              # Complex product
│   ├── FactoryDesign/            # Quiz application
│   │   ├── Client.dart           # Quiz runner
│   │   ├── quiz_app.dart         # Main application
│   │   ├── Creators/             # Factory methods
│   │   └── Products/             # Quiz sheets
│   ├── Prototype/                # Team management
│   │   ├── teams_app.dart        # Demo application
│   │   └── models/               # Cloneable objects
│   └── Singleton/                # Social media app
│       ├── insta_app.dart        # Main application
│       └── database/             # Singleton manager
├── 🏢 Structural/
│   ├── Adapter/                  # Network integration
│   │   ├── main.dart             # Network monitor demo
│   │   ├── adapters/             # Adapter implementations
│   │   ├── adaptees/             # Vendor-specific classes
│   │   └── interfaces/           # Common interface
│   ├── Bridge/                   # AI task processing
│   │   ├── main.dart             # AI task runner
│   │   ├── abstractions/         # Task abstractions
│   │   └── implementations/      # AI model implementations
│   ├── Composite/                # Question system
│   │   ├── client.dart           # Hierarchy demo
│   │   └── interfaces/           # Component interface
│   ├── Facade/                   # Game engine
│   │   ├── client.dart           # Game control demo
│   │   ├── facade/               # Simplified interface
│   │   └── subsystems/           # Complex subsystems
│   ├── Flyweight/                # Map rendering
│   │   ├── client.dart           # Map demo
│   │   ├── flyweights/           # Shared objects
│   │   └── memory_calculator.dart # Memory usage tracker
│   └── Proxy/                    # 3D model loading
│       ├── client.dart           # 3D viewer demo
│       └── interfaces/           # Model interface
└── 📚 README.md                  # This file
```

## 🎯 Pattern Examples

### Adapter Pattern - Network Integration
**Problem**: Different router vendors (Cisco, HP, Juniper) provide network data in incompatible formats.

```dart
// Unified interface for all routers
NetworkInformation router = CiscoNetworkAdapter();
Map<String, dynamic> data = router.getNetworkInfo();
// Works the same for HP and Juniper routers!
```

### Builder Pattern - Game Level Creation
**Problem**: Mario levels need complex construction with many optional components.

```dart
MarioLevel castle = CastleLevelBuilder()
    .setName('World 1-4')
    .build();
castle.displayLevel();
```

### Singleton Pattern - Database Management
**Problem**: Need exactly one database connection manager across the application.

```dart
PostManager manager = PostManager.getPostManager('MongoDB');
// Always returns the same instance
```

## 📋 Prerequisites

- **Dart SDK**: Version 2.12 or higher
- **Git**: For cloning the repository
- **Terminal/Command Prompt**: For running examples

### Installing Dart

#### Windows
```bash
choco install dart-sdk
```

#### macOS
```bash
brew install dart
```

#### Linux
```bash
sudo apt-get update
sudo apt-get install dart
```

## 🛠️ Installation & Setup

### 1. Clone Repository
```bash
git clone https://github.com/yourusername/Dart_Design_Patterns.git
cd Dart_Design_Patterns
```

### 2. Install Dependencies (if needed)
Some patterns require additional packages:

```bash
# For Adapter pattern (XML parsing)
cd Structural/Adapter
dart pub get

# For Bridge pattern (async operations)
cd ../Bridge
dart pub get
```

### 3. Verify Installation
```bash
dart --version
# Should show Dart SDK version 2.12.0 or higher
```

## 🎮 Usage Examples

### Running Individual Patterns

#### Creational Patterns

```bash
# 1. Abstract Factory - Cross-platform UI
cd Creational/AbstractFactory
dart run Client.dart

# 2. Builder - Mario Level Creator
cd ../Builder
dart run game_runner.dart

# 3. Factory Method - Quiz Generator
cd ../FactoryDesign
dart run Client.dart

# 4. Prototype - Team Cloning
cd ../Prototype
dart run teams_app.dart

# 5. Singleton - Social Media App
cd ../Singleton
dart run insta_app.dart
```

#### Structural Patterns

```bash
# 6. Adapter - Network Monitoring
cd Structural/Adapter
dart run main.dart

# 7. Bridge - AI Task Runner
cd ../Bridge
dart run main.dart

# 8. Composite - Question Hierarchy
cd ../Composite
dart run client.dart

# 9. Facade - Game Engine
cd ../Facade
dart run client.dart

# 10. Flyweight - Map Renderer
cd ../Flyweight
dart run client.dart

# 11. Proxy - 3D Model Viewer
cd ../Proxy
dart run client.dart
```

### Sample Output

#### Adapter Pattern Demo
```
=== Network Monitoring System ===
1. Show Cisco Router Info
2. Show HP Router Info
3. Show Juniper Router Info
4. Show Overall Network Statistics
5. Exit

Enter your choice: 1

--- Cisco Router ---
Router_Id : Cisco123
Bandwidth_Available : 123Mbps
SecurityStatus : High
Network_Health : 95%
```

#### Builder Pattern Demo
```
🍄 Mario Level Builder Demo 🍄

🏰 Building World 1-4 (Castle Level)
Background: Dark castle walls with lava pits
Platforms: Drawbridge, Stone platform 1, Stone platform 2
Enemies: Bowser, Fire bar 1, Fire bar 2
Power-ups: Fire Flower
Music: Castle Theme
```
