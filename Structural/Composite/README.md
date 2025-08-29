# Composite Design Pattern

## Overview

The **Composite** is a structural design pattern that allows you to compose objects into tree structures to represent part-whole hierarchies. It lets clients treat individual objects and compositions uniformly through a common interface.

## Intent

- Compose objects into tree structures to represent part-whole hierarchies
- Let clients treat individual objects and compositions of objects uniformly
- Make it easier to add new kinds of components
- Provide a structure for building a hierarchy of objects
- Simplify client code by treating complex and simple elements the same way

## Problem Solved

When working with tree-like hierarchical structures, you often face:

1. **Complex Tree Navigation** - Different handling for leaves vs containers
2. **Code Duplication** - Similar operations on individual items and groups
3. **Type Checking** - Client needs to know if dealing with single item or collection
4. **Scalability Issues** - Adding new component types requires widespread changes

## Implementation: Learning Content Management System

This implementation demonstrates the Composite pattern using an educational content management system where individual questions and question containers can be treated uniformly for time calculation and content organization.

### Structure

```
LearningComponent (Component Interface)
└── getTimeTakenToComplete(UserLevel) : Duration

Question (Leaf)
├── questionText : String
├── timeMap : Map<UserLevel, Duration>
└── getTimeTakenToComplete(UserLevel) : Duration

QuestionContainer (Composite)
├── name : String
├── components : List<LearningComponent>
├── add(LearningComponent) : void
├── remove(LearningComponent) : void
├── getTimeTakenToComplete(UserLevel) : Duration
└── getComponentCount() : int

UserLevel (Enum)
├── Beginner
├── Intermediate
└── Advanced
```

### Core Components

1. **Component Interface**: `LearningComponent`
   - Defines common interface for both leaves and composites
   - Contains `getTimeTakenToComplete()` method for time estimation
   - Enables uniform treatment of all content types

2. **Leaf**: `Question`
   - Represents individual learning questions
   - Stores question text and time estimates per user level
   - Implements time calculation for single questions

3. **Composite**: `QuestionContainer`
   - Represents groups of learning components (questions or other containers)
   - Can contain both questions and other containers
   - Aggregates time calculations from all child components
   - Provides tree management operations (add/remove)

4. **Context Data**: `UserLevel`
   - Enum defining learner skill levels (Beginner, Intermediate, Advanced)
   - Used to determine appropriate time estimates
   - Demonstrates context-dependent calculations

### Key Features

#### **Hierarchical Structure**
- **Questions**: Individual learning items (leaves)
- **Containers**: Groups of questions or other containers (composites)  
- **Nested Containers**: Containers can contain other containers for complex hierarchies

#### **Uniform Time Calculation**
- **Question Level**: Returns specific time for user level
- **Container Level**: Aggregates time from all child components
- **Recursive Processing**: Automatically handles nested structures

#### **Skill-Based Estimation**
- **Beginner**: Longer time estimates for complex concepts
- **Intermediate**: Moderate time estimates
- **Advanced**: Shorter time estimates for familiar concepts

### Usage Example

```dart
// Create individual questions (leaves)
var mathQuestion = Question(
  "What is 2+2?",
  {
    UserLevel.Beginner: Duration(minutes: 3),
    UserLevel.Intermediate: Duration(minutes: 1),
    UserLevel.Advanced: Duration(seconds: 30),
  }
);

var algebraQuestion = Question(
  "Solve: 2x + 5 = 13", 
  {
    UserLevel.Beginner: Duration(minutes: 8),
    UserLevel.Intermediate: Duration(minutes: 4),
    UserLevel.Advanced: Duration(minutes: 2),
  }
);

// Create containers (composites)
var basicMath = QuestionContainer("Basic Math");
var fullCourse = QuestionContainer("Complete Math Course");

// Build hierarchy
basicMath.add(mathQuestion);
basicMath.add(algebraQuestion);
fullCourse.add(basicMath);

// Uniform interface for time calculation
Duration questionTime = mathQuestion.getTimeTakenToComplete(UserLevel.Beginner);     // 3 minutes
Duration containerTime = basicMath.getTimeTakenToComplete(UserLevel.Beginner);      // 11 minutes  
Duration courseTime = fullCourse.getTimeTakenToComplete(UserLevel.Beginner);        // 11 minutes

// Same method works for leaves and composites!
```

## Benefits

### Advantages

1. **Uniform Interface**: Same operations work on individual items and groups
2. **Simplified Client Code**: No need to distinguish between leaves and composites
3. **Recursive Operations**: Operations automatically traverse entire tree structure
4. **Easy Extension**: Simple to add new component types
5. **Flexible Hierarchies**: Can create arbitrarily complex tree structures

### Considerations

1. **Overly General Design**: Makes it harder to restrict component types
2. **Type Safety**: Interface must be general enough for all component types
3. **Performance**: Recursive operations can be expensive for large trees
4. **Memory Usage**: Tree structures can consume significant memory

## When to Use

### Use Composite When:

- You want to represent part-whole hierarchies of objects
- You want clients to ignore the difference between individual objects and compositions
- The structure can be represented as a tree
- You want to apply the same operations to individual objects and groups

### Avoid Composite When:

- You don't have hierarchical structures
- Operations are fundamentally different for leaves vs composites
- Type safety is more important than uniform interface
- Performance is critical and tree traversal overhead is unacceptable

## Composite Variations

### 1. **Transparent Composite** (This Implementation)
- All components have same interface including tree management operations
- Simple and uniform but may expose inappropriate operations on leaves
- Component interface includes child management methods

### 2. **Safe Composite**
- Tree management operations only available on composite objects
- Type-safe but requires runtime type checking
- Separate interfaces for leaves and composites

### 3. **Cached Composite**
- Stores calculated results to avoid repeated computations
- Better performance for expensive operations
- Requires cache invalidation strategy

## Real-World Applications

### 1. **Educational Systems** (This Implementation)
- **Course Structures**: Courses → Modules → Lessons → Questions
- **Learning Paths**: Complex hierarchies of learning content
- **Time Estimation**: Aggregate time calculations for entire curricula

### 2. **File Systems**
- **Directories**: Can contain files or other directories
- **Operations**: Copy, move, delete work same on files and folders
- **Size Calculation**: Aggregate size of directory contents

### 3. **GUI Development**
- **UI Components**: Panels containing buttons, text fields, other panels
- **Event Handling**: Same event propagation for simple and complex components
- **Layout Management**: Uniform layout calculations

### 4. **Organizational Structures**
- **Company Hierarchy**: Departments containing employees or sub-departments
- **Budget Calculation**: Aggregate costs across organizational units
- **Reporting**: Same reporting interface for individuals and teams

### 5. **Graphics and Drawing**
- **Shape Hierarchies**: Groups containing shapes or other groups
- **Transformations**: Apply same operations to individual shapes and groups
- **Rendering**: Uniform rendering interface for all drawable objects

## Design Principles Demonstrated

1. **Single Responsibility**: Each component handles its own specific behavior
2. **Open/Closed**: Easy to add new component types without changing existing code
3. **Liskov Substitution**: All components can be used interchangeably
4. **Composite Reuse**: Build complex structures from simple components

## Pattern Relationships

- **Iterator**: Often used to traverse composite structures
- **Visitor**: Can be used to perform operations on composite structures
- **Decorator**: Can be combined with Composite to add behavior to components
- **Command**: Composite commands can contain other commands

## Implementation Considerations

### **Child Management**
- **Add/Remove Operations**: Who can add/remove children?
- **Parent References**: Should children know their parents?
- **Ordering**: Does child order matter?

### **Error Handling**
- **Invalid Operations**: What happens when leaf operations are called on composites?
- **Circular References**: How to prevent infinite loops?
- **Memory Management**: How to handle component lifecycle?

### **Performance Optimization**
- **Caching**: Cache expensive calculations
- **Lazy Evaluation**: Defer calculations until needed
- **Tree Balancing**: Optimize tree structure for performance

## File Structure

```
Composite/
├── README.md                        # This documentation
├── main.dart                        # Client demonstration
├── interfaces/
│   └── IContent.dart               # Component interface
├── components/
│   ├── question.dart               # Leaf implementation
│   └── container.dart              # Composite implementation
└── constants/
    └── user_level_enums.dart       # User skill level enumeration
```

## Running the Example

1. Navigate to the Composite directory
2. Run the demonstration:
   ```bash
   dart run main.dart
   ```
3. Observe how time calculations work uniformly across individual questions and question containers
4. Notice how nested containers automatically aggregate times from all descendants

## Key Takeaways

The Composite pattern is excellent for:
- **Building Tree Structures** where parts and wholes need uniform treatment
- **Simplifying Client Code** by eliminating type-based branching
- **Creating Scalable Hierarchies** that can grow in complexity
- **Implementing Recursive Operations** that work across entire structures

This learning content management implementation demonstrates how the same time calculation logic can work seamlessly across individual questions and complex course hierarchies, showcasing the pattern's power for creating flexible, maintainable tree-based systems.
