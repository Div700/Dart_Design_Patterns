```markdown
# Question Container Strategy Pattern - Dart Implementation

A simple implementation of the Strategy design pattern for arranging quiz questions using different learning strategies.

## Overview

This project demonstrates how different question arrangement strategies can be applied to learning containers. Each container holds a set of questions and uses a specific strategy to determine the optimal order for presenting them to learners.

## Features

- **Multiple Strategies**: Bayes (adaptive) and Linear (progressive) question arrangement
- **Question Container**: Manages questions with configurable parameters
- **Strategy Registry**: Factory pattern for easy strategy selection
- **Flexible Parameters**: Each container can be configured with custom parameters

## Project Structure

```
lib/
├── models/
│   └── question.dart           # Question data model
├── strategies/
│   ├── learning_strategy.dart  # Strategy interface
│   ├── bayes_strategy.dart    # Adaptive learning strategy
│   └── linear_strategy.dart   # Progressive learning strategy
├── registry/
│   └── strategy_registry.dart # Strategy factory
└── containers/
    └── question_container.dart # Container for questions

example/
└── main.dart                  # Demo application
```

## Strategies

### Bayes Strategy
- **Approach**: Adaptive learning (Medium → Easy → Hard)
- **Benefits**: Builds confidence, then reinforces with easy questions, ends with challenges
- **Use Case**: Personalized learning experiences

### Linear Strategy
- **Approach**: Progressive learning (Easy → Hard)
- **Benefits**: Systematic difficulty progression
- **Use Case**: Traditional structured learning

## Question Model

Each question contains:
- **ID**: Unique identifier
- **Text**: Question content
- **Difficulty**: Level (1=Easy, 2=Medium, 3=Hard)
- **Topic**: Subject category

## Container Features

- Holds multiple questions
- Configurable strategy selection
- Custom parameters support
- Question statistics and topic distribution
- Dynamic strategy switching

## Running the Demo

```bash
dart run example/main.dart
```

## Sample Output

```
=== QUESTION CONTAINER STRATEGY DEMO ===

--- CONTAINER 1: BAYES STRATEGY ---
Container Name: Math Quiz Container
Strategy: bayes
Total Questions: 4
Topics: {Math: 4}

Question Sequence:
  1. Q3: What is 7 × 8? [Math, diff: 2]
  2. Q1: What is 2 + 2? [Math, diff: 1]
  3. Q2: Solve: 3x + 5 = 14 [Math, diff: 3]
```

## Benefits of Strategy Pattern

- **Flexibility**: Easy to switch between different question arrangement algorithms
- **Extensibility**: New strategies can be added without modifying existing code
- **Separation of Concerns**: Strategy logic is separate from container management
- **Runtime Selection**: Strategies can be chosen dynamically based on user preferences

## Use Cases

- **Educational Apps**: Adaptive quiz systems
- **Online Learning**: Personalized question sequences
- **Assessment Tools**: Different evaluation approaches
- **Training Systems**: Skill-based learning paths

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Run the demo:
   ```bash
   dart run example/main.dart
   ```

## Requirements

- Dart SDK 2.17.0 or higher

## Design Pattern

**Strategy Pattern** - A behavioral design pattern that defines a family of algorithms, encapsulates each one, and makes them interchangeable at runtime.
```