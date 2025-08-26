# Flyweight Design Pattern

## Overview

The **Flyweight** is a structural design pattern that minimizes memory usage by sharing efficiently among multiple similar objects. Instead of storing all data in each object, flyweights share common intrinsic state while extrinsic state is stored separately and passed to flyweight methods when needed.

## Intent

- Use sharing to support large numbers of fine-grained objects efficiently
- Minimize memory usage when dealing with thousands or millions of similar objects
- Separate intrinsic state (shared) from extrinsic state (context-specific)
- Reduce the cost of creating and maintaining large numbers of similar objects

## Problem Solved

When applications need to create large numbers of similar objects, you often encounter:

1. **Memory Exhaustion** - Each object stores duplicate data
2. **Performance Degradation** - Too many objects slow down the system
3. **Resource Waste** - Identical information stored multiple times
4. **Scalability Issues** - Memory usage grows linearly with object count

## Implementation: Map Application with Location Icons

This implementation demonstrates a map application where thousands of location markers share a small number of icon types, achieving significant memory savings.

### Structure

```
IconFlyweight (Interface)
├── iconSymbol : String
├── iconColor : String  
├── iconSize : int
├── displayIcon() : void
└── getMemoryFootprint() : int

Concrete Flyweights:
├── RestaurantIcon (🍽️ orange 24px)
├── GasStationIcon (⛽ blue 22px)  
└── HotelIcon (🏨 purple 26px)

IconFactory
├── _flyweights : Map<String, IconFlyweight>
├── getFlyweight(type) : IconFlyweight
└── getFlyweightCount() : int

IconContext
├── latitude : double (extrinsic)
├── longitude : double (extrinsic)
├── name : String (extrinsic)
├── _flyweight : IconFlyweight (reference)
└── render() : void
```

### Core Components

1. **Flyweight Interface**: `IconFlyweight`
   - Defines intrinsic properties shared across instances
   - Contains icon symbol, color, and size
   - Provides display operations

2. **Concrete Flyweights**: Icon implementations
   - **RestaurantIcon**: 🍽️ orange 24px (~10KB)
   - **GasStationIcon**: ⛽ blue 22px (~10KB)
   - **HotelIcon**: 🏨 purple 26px (~10KB)

3. **Flyweight Factory**: `IconFactory`
   - Manages flyweight instances using singleton pattern
   - Ensures only one instance per icon type
   - Provides access to created flyweights

4. **Context**: `IconContext`
   - Stores extrinsic state (location coordinates, name)
   - References appropriate flyweight for icon data
   - Handles rendering by combining context and flyweight

### Key Features

#### 💾 **Memory Optimization**
- **Intrinsic State**: Icon properties shared among all instances of same type
- **Extrinsic State**: Location-specific data stored in context
- **Sharing**: Multiple contexts reference same flyweight object

#### 📊 **Memory Comparison**
- **Without Flyweight**: 180 locations × 10.04KB = ~1.8MB
- **With Flyweight**: 3 flyweights × 10KB + 180 contexts × 44 bytes = ~37KB
- **Memory Saved**: ~98% reduction (48x more efficient)

#### 🏭 **Factory Management**
- Centralized flyweight creation and management
- Automatic reuse of existing flyweight instances
- Runtime statistics for monitoring

### Usage Example

```dart
// Create contexts - flyweights are shared automatically
var restaurant1 = IconContext(
  latitude: 40.7580, 
  longitude: -73.9855,
  name: "Joe's Pizza", 
  iconType: "restaurant"
);

var restaurant2 = IconContext(
  latitude: 40.7590, 
  longitude: -73.9865,
  name: "Burger King", 
  iconType: "restaurant"
);

var gasStation = IconContext(
  latitude: 40.7600, 
  longitude: -73.9800,
  name: "Shell Station", 
  iconType: "gasstation"
);

// Both restaurants share the same RestaurantIcon flyweight
// Only 2 flyweight objects created for 3 contexts
restaurant1.render(); // 🍽️ [orange, 24px] at Joe's Pizza
restaurant2.render(); // 🍽️ [orange, 24px] at Burger King  
gasStation.render();  // ⛽ [blue, 22px] at Shell Station
```

## Benefits

### ✅ Advantages

1. **Massive Memory Savings**: 98% memory reduction in this example
2. **Improved Performance**: Fewer objects mean better cache efficiency
3. **Scalability**: Can handle millions of objects with minimal memory impact
4. **Centralized Management**: Factory pattern simplifies flyweight lifecycle
5. **Transparency**: Context objects work normally despite sharing flyweights

### ⚠️ Considerations

1. **Complexity**: Adds layer of abstraction between objects and data
2. **Context Overhead**: Need to pass extrinsic state to flyweight methods
3. **Thread Safety**: Shared flyweights must be immutable or thread-safe
4. **Design Constraints**: Clear separation between intrinsic and extrinsic state required

## When to Use

### ✅ Use Flyweight When:

- Application needs to spawn huge numbers of similar objects
- Storage costs are high due to sheer quantity of objects
- Groups of objects can be replaced by shared objects
- Extrinsic state can be moved out of objects
- Object identity isn't important to application logic

### ❌ Avoid Flyweight When:

- Application doesn't use large numbers of objects
- Extrinsic state can't be easily separated
- Objects need to maintain unique identity
- The complexity isn't justified by memory savings

## Real-World Applications

### 1. **Gaming**
- **Particle Systems**: Thousands of bullets, sparks, debris
- **Terrain Tiles**: Repeated ground, water, grass textures
- **NPCs**: Shared character models with different positions/stats

### 2. **GUI Applications**
- **Icons**: File type icons shared across file explorers
- **Fonts**: Character glyphs shared across text rendering
- **UI Controls**: Buttons, widgets with different data

### 3. **Web Development**
- **Map Applications**: Location markers (like this implementation)
- **Social Media**: User avatars, status icons
- **E-commerce**: Product category icons, rating stars

### 4. **Document Processing**
- **Text Editors**: Character objects sharing font/style data
- **PDF Rendering**: Shared font and image resources
- **Spreadsheets**: Cell formatting objects

## Pattern Variations

### 1. **Pure Flyweight** (This Implementation)
- All intrinsic state stored in flyweight
- Extrinsic state always passed as parameters
- Maximum memory efficiency

### 2. **Compound Flyweight**
- Flyweight composed of other flyweights
- Hierarchical sharing structure
- More complex but flexible

### 3. **Unshared Flyweight**
- Some objects act as flyweights, others don't
- Hybrid approach for mixed scenarios
- Balances flexibility and efficiency

## Related Patterns

- **Factory Method**: Creates flyweight instances
- **Singleton**: Flyweight factory often implemented as singleton
- **Composite**: Compound flyweights use composite structure
- **Strategy**: Flyweights can encapsulate algorithms

## Performance Metrics

Based on the demo with 180 locations:

| Metric | Without Flyweight | With Flyweight | Improvement |
|--------|------------------|----------------|-------------|
| **Memory Usage** | ~1.8MB | ~37KB | 48x better |
| **Objects Created** | 180 | 183 (180 contexts + 3 flyweights) | Similar |
| **Icon Objects** | 180 | 3 | 60x fewer |
| **Memory per Location** | ~10KB | ~200 bytes | 50x reduction |

## File Structure

```
Flyweight/
├── README.md                          # This documentation
├── main.dart                          # Client demonstration
├── flyweight_factory.dart             # Factory for managing flyweights
├── map_icon_context.dart             # Context storing extrinsic state
├── interfaces/
│   └── abstract_icon_flyweight.dart   # Flyweight interface
├── flyweights/
│   ├── gas_station_flyweight.dart     # Gas station icon flyweight
│   ├── hote_icon_flyweight.dart       # Hotel icon flyweight
│   └── restraunt_icon_flyweight.dart  # Restaurant icon flyweight
└── helpers/
    ├── map_renderer.dart              # Rendering utility
    └── memory_calculator.dart         # Memory usage analysis
```

## Running the Example

1. Navigate to the Flyweight directory
2. Run the demonstration:
   ```bash
   dart run main.dart
   ```
3. Observe the memory usage comparison and sharing statistics

## Key Takeaways

The Flyweight pattern is excellent for:
- **Massive Memory Optimization** when dealing with thousands of similar objects
- **Performance Improvement** through reduced object creation and better cache usage
- **Scalable Architectures** that need to handle large datasets efficiently
- **Resource Management** in memory-constrained environments

This map application implementation shows how sharing just 3 icon flyweights among 180 locations achieves a 98% memory reduction, demonstrating the pattern's power for handling large-scale object collections efficiently.
