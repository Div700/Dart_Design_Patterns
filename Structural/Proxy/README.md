# Proxy Design Pattern

## Overview

The **Proxy** is a structural design pattern that provides a placeholder or surrogate for another object to control access to it. This pattern creates a proxy object that acts as an interface to the real object, allowing you to perform additional operations before or after the request reaches the original object.

## Intent

- Provide a surrogate or placeholder for another object to control access to it
- Add an extra level of indirection to support distributed, controlled, or intelligent access
- Defer expensive operations until they are actually needed (lazy initialization)
- Control access to resources that are expensive to create or maintain

## Problem Solved

When you have objects that are expensive to create, consume significant memory, or require special access control, directly using them can lead to:

1. **Performance Issues** - Loading all objects upfront regardless of need
2. **Memory Waste** - Keeping unused heavy objects in memory
3. **Network Overhead** - Unnecessary remote calls or resource loading
4. **Security Concerns** - Uncontrolled access to sensitive resources

## Implementation: 3D Game World Virtual Proxy

This implementation demonstrates a **Virtual Proxy** for a 3D gaming scenario where expensive 3D models are only loaded when the player is close enough to see them.

### Structure

```
IModel3d (Interface)
├── render() : void

Model3d (Real Subject)
├── modelName : String
├── xCoordinate : int
├── yCoordinate : int
├── constructor() - Expensive model loading
└── render() : void

Model3dProxy (Proxy)
├── _model : Model3d?
├── modelName : String
├── xCoordinate : int
├── yCoordinate : int
├── VIEW_DISTANCE : double
├── PlayerXCoordinate : int (static)
├── PlayerYCoordinate : int (static)
├── render() : void
├── _calculateDistance() : double
├── _isInPlayerView() : bool
└── updatePlayerPosition() : void (static)
```

### Core Components

1. **Interface**: `Imodel3d`
   - Defines the common interface for both real objects and proxies
   - Contains the `render()` method that both implementations must provide

2. **Real Subject**: `Model3d`
   - The actual 3D model class with expensive initialization
   - Simulates loading 50,000 vertices, textures, and animations
   - Performs the actual rendering when called

3. **Proxy**: `Model3dProxy`
   - Controls access to Model3d based on player distance
   - Only creates the real Model3d when player is within viewing distance
   - Implements lazy initialization and distance calculations

### Key Features

#### 🎯 **Distance-Based Loading**
- **View Distance**: 15 units from player position
- **Lazy Loading**: Models only created when needed
- **Performance Optimization**: Avoids loading distant objects

#### 📐 **Distance Calculation**
- Uses Pythagorean theorem: `sqrt((x2-x1)² + (y2-y1)²)`
- Real-time distance checking on each render call
- Efficient coordinate-based positioning system

#### 🚶 **Player Movement System**
- Static player position tracking
- Dynamic view distance calculations
- Models automatically load/unload as player moves

### Usage Example

```dart
// Create models as lightweight proxies
var car = Model3dProxy('Sports Car', 5, 8);
var building = Model3dProxy('Skyscraper', 50, 50);

// Models are not loaded yet - just proxy objects created

// Player at origin (0,0)
car.render();      // Distance 9.4 - loads and renders (within 15 units)
building.render(); // Distance 70.7 - too far, doesn't load

// Player moves closer to building
Model3dProxy.updatePlayerPosition(45, 45);
building.render(); // Distance 7.1 - now loads and renders
car.render();      // Distance 64.0 - too far, no longer rendered
```

## Benefits

### ✅ Advantages

1. **Memory Efficiency**: Only loads objects when actually needed
2. **Performance Optimization**: Avoids expensive operations for distant objects
3. **Transparent Access**: Client code doesn't know if it's working with proxy or real object
4. **Scalability**: Can handle thousands of objects without performance degradation
5. **Flexible Control**: Easy to modify loading criteria (distance, visibility, etc.)

### ⚠️ Considerations

1. **Complexity**: Adds an extra layer of indirection
2. **Latency**: First-time loading may cause slight delays
3. **Memory Overhead**: Proxy objects still consume some memory
4. **State Management**: Need to track proxy state and real object lifecycle

## When to Use

### ✅ Use Proxy When:

- Objects are expensive to create or maintain in memory
- You need lazy initialization for performance reasons
- Access control or additional behavior is required before reaching the real object
- Working with remote objects or resources
- You need to cache expensive operations

### ❌ Avoid Proxy When:

- Objects are lightweight and cheap to create
- Direct access is simpler and performance isn't a concern
- The proxy logic becomes more complex than the benefit it provides
- You need immediate access to all objects regardless of conditions

## Types of Proxies

### 1. **Virtual Proxy** (This Implementation)
- **Purpose**: Controls access to expensive objects
- **Use Case**: 3D models, large images, database connections
- **Benefit**: Defers object creation until needed

### 2. **Remote Proxy**
- **Purpose**: Represents objects in different address spaces
- **Use Case**: Web services, distributed systems
- **Benefit**: Handles network communication complexity

### 3. **Protection Proxy**
- **Purpose**: Controls access based on permissions
- **Use Case**: User authentication, resource access control
- **Benefit**: Adds security layer without changing core logic

### 4. **Smart Reference**
- **Purpose**: Provides additional behavior when accessing objects
- **Use Case**: Reference counting, caching, logging
- **Benefit**: Transparent enhancement of object behavior

## Real-World Applications

1. **Gaming**:
   - Level-of-detail (LOD) systems
   - Texture streaming
   - Audio loading based on distance

2. **Web Development**:
   - Image lazy loading
   - API response caching
   - Database connection pooling

3. **Enterprise Applications**:
   - File system access control
   - Network resource management
   - Heavy computation deferral

4. **Mobile Development**:
   - Memory-conscious image loading
   - Network request optimization
   - Battery life preservation

## Related Patterns

- **Adapter**: Changes interface, Proxy keeps same interface
- **Decorator**: Adds functionality, Proxy controls access
- **Facade**: Simplifies complex subsystem, Proxy represents single object

## File Structure

```
Proxy/
├── README.md                   # This documentation
├── main.dart                   # Client demonstration
├── 3D_Model_Proxy.dart        # Proxy implementation
├── 3D_Model_display.dart      # Real subject (Model3d)
└── interfaces/
    └── i_model_3d.dart         # Common interface
```

## Running the Example

1. Navigate to the Proxy directory
2. Run the demonstration:
   ```bash
   dart run main.dart
   ```
3. Observe how models are loaded/unloaded as the player moves through different scenarios

## Key Takeaways

The Proxy pattern is excellent for:
- **Performance Optimization** through lazy loading
- **Resource Management** for expensive objects
- **Access Control** without changing existing code
- **Transparent Enhancement** of object behavior

This 3D gaming implementation showcases how proxies can dramatically improve performance by only loading game assets when they're actually visible to the player, making it possible to create vast game worlds without consuming excessive memory or processing power.
