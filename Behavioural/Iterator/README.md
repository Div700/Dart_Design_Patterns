# Iterator Design Pattern

## Overview

The **Iterator** is a behavioral design pattern that provides a way to access elements of a collection sequentially without exposing the underlying representation. It encapsulates the traversal logic and provides a uniform interface for iterating over different data structures.

## Intent

- Provide a way to access elements of an aggregate object sequentially without exposing its underlying representation
- Support multiple traversal algorithms over the same collection
- Provide a uniform interface for traversing different aggregate structures
- Remove traversal responsibility from the aggregate object to keep it focused on its primary responsibility

## Problem Solved

When working with collections, you often need to:

1. **Access Elements** - Traverse through all items in a collection
2. **Hide Implementation Details** - Abstract away List vs Map vs other structures
3. **Support Multiple Traversals** - Allow different iteration strategies
4. **Maintain Encapsulation** - Keep collection's internal structure private

## Implementation: Shopping Cart Iterator

This implementation demonstrates the Iterator pattern using a shopping cart that can be backed by different data structures (List and Map) while providing a unified iteration interface.

### Structure

```
CartIterator (Interface)
├── hasNext() : bool
└── next() : CartItem

IIterable (Interface)  
└── createIterator() : CartIterator

CartList (Concrete Aggregate)
├── cartItems : List<CartItem>
├── addItem(item) : void
├── removeItem(item) : void
└── createIterator() : CartIterator

CartMap (Concrete Aggregate)  
├── cartItems : Map<String, CartItem>
├── addItem(key, item) : void
├── removeItem(key) : void
└── createIterator() : CartIterator

ListIterator (Concrete Iterator)
├── _items : List<CartItem>
├── _currentIndex : int
├── hasNext() : bool
└── next() : CartItem

MapIterator (Concrete Iterator)
├── _items : List<CartItem>  
├── _currentIndex : int
├── hasNext() : bool
└── next() : CartItem
```

### Core Components

1. **Iterator Interface**: `CartIterator`
   - Defines the iteration protocol with `hasNext()` and `next()`
   - Provides uniform access regardless of underlying storage

2. **Aggregate Interface**: `IIterable`
   - Declares factory method for creating iterators
   - Allows collections to provide their own iterator implementation

3. **Concrete Aggregates**: Collection implementations
   - **CartList**: Uses List<CartItem> for storage
   - **CartMap**: Uses Map<String, CartItem> for storage

4. **Concrete Iterators**: Traversal implementations
   - **ListIterator**: Iterates over List-based cart
   - **MapIterator**: Iterates over Map-based cart (converts to List internally)

5. **Data Model**: `CartItem`
   - Represents items in shopping cart with name and price
   - Simple value object for demonstration

### Key Features

#### 🔄 **Uniform Iteration Interface**
- Same iteration code works for List and Map storage
- Client doesn't need to know underlying data structure
- Consistent `hasNext()` and `next()` pattern

#### 📦 **Multiple Storage Strategies**
- **List Storage**: Simple indexed access, maintains order
- **Map Storage**: Key-based access, allows named retrieval
- **Transparent Access**: Iterator hides implementation differences

#### 🎯 **Encapsulation**
- Internal collection structure remains private
- Iterator provides controlled access to elements
- Collection can change implementation without affecting clients

### Usage Example

```dart
// List-based cart
var listCart = CartList();
listCart.addItem(CartItem('Phone', 999.99));
listCart.addItem(CartItem('Case', 29.99));

// Unified iteration interface
var iterator = listCart.createIterator();
while (iterator.hasNext()) {
  print(iterator.next()); // Phone - $999.99, Case - $29.99
}

// Map-based cart with same iteration pattern
var mapCart = CartMap();
mapCart.addItem('phone', CartItem('Phone', 999.99));
mapCart.addItem('case', CartItem('Case', 29.99));

// Same iteration code works!
var mapIterator = mapCart.createIterator();
while (mapIterator.hasNext()) {
  print(mapIterator.next()); // Same output, different storage
}
```

## Benefits

### ✅ Advantages

1. **Uniform Interface**: Same iteration code works across different collections
2. **Encapsulation**: Internal collection structure remains hidden
3. **Flexibility**: Easy to switch between different storage implementations
4. **Single Responsibility**: Iterator handles traversal, collection handles storage
5. **Multiple Iterators**: Can have multiple iterators over same collection

### ⚠️ Considerations

1. **Overhead**: Extra classes and interfaces add complexity
2. **Memory Usage**: Iterator objects consume additional memory
3. **Modification Issues**: Collection changes during iteration can cause problems
4. **Performance**: Indirect access may be slower than direct indexing

## When to Use

### ✅ Use Iterator When:

- You need to traverse collections without exposing their internal structure
- You want to support multiple traversal algorithms
- You have different collection implementations that need uniform access
- You want to separate traversal logic from collection logic
- Collections might change their internal representation

### ❌ Avoid Iterator When:

- You're working with simple, small collections where direct access is sufficient
- Performance is critical and the overhead isn't justified
- You only have one type of collection and it's unlikely to change
- The iteration pattern is extremely simple and doesn't benefit from abstraction

## Iterator Variations

### 1. **External Iterator** (This Implementation)
- Client controls iteration process
- Calls hasNext() and next() explicitly
- More control over iteration flow

### 2. **Internal Iterator**
- Collection controls iteration
- Client provides callback/lambda function
- Simpler for client but less control

### 3. **Robust Iterator**
- Handles collection modifications during iteration
- Maintains consistency even if collection changes
- More complex but safer implementation

## Real-World Applications

### 1. **E-commerce**
- **Shopping Carts**: Different storage strategies (database, memory, cache)
- **Product Catalogs**: Various filtering and sorting approaches
- **Order History**: Consistent access across different storage backends

### 2. **Data Processing**
- **File Systems**: Iterating through files regardless of storage type
- **Database Records**: Uniform access across different database types
- **API Responses**: Consistent iteration over paginated results

### 3. **UI Development**
- **List Views**: Consistent rendering regardless of data source
- **Form Fields**: Iterating through different input types uniformly
- **Menu Systems**: Traversing hierarchical structures

### 4. **Gaming**
- **Inventory Systems**: Different storage for different item types
- **Level Objects**: Iterating through game entities uniformly
- **Save Systems**: Consistent access to game state data

## Related Patterns

- **Composite**: Often used together - iterating through composite structures
- **Factory Method**: Collections can use factory methods to create appropriate iterators
- **Visitor**: Iterator can be used to traverse structures that Visitor operates on
- **Command**: Iterator traversal can be encapsulated in commands

## Design Principles Demonstrated

1. **Single Responsibility**: Iterator handles traversal, collection handles storage
2. **Open/Closed**: Easy to add new collection types without changing existing code
3. **Liskov Substitution**: All iterators can be used interchangeably
4. **Dependency Inversion**: Client depends on Iterator abstraction, not concrete types

## File Structure

```
Iterator/
├── README.md                    # This documentation
├── main.dart                    # Client demonstration
├── models/
│   └── cart_item.dart          # Data model for cart items
├── interfaces/
│   ├── cart_iterator.dart      # Iterator interface
│   └── iterable.dart           # Aggregate interface
├── structures/
│   ├── cart_list.dart          # List-based cart implementation
│   └── cart_map.dart           # Map-based cart implementation
└── iterators/
    ├── list_iterator.dart      # Iterator for List-based cart
    └── map_iterator.dart       # Iterator for Map-based cart
```

## Running the Example

1. Navigate to the Iterator directory
2. Run the demonstration:
   ```bash
   dart run main.dart
   ```
3. Observe how the same iteration code works with different storage mechanisms

## Key Takeaways

The Iterator pattern is excellent for:
- **Providing Uniform Access** to different collection types
- **Encapsulating Traversal Logic** separate from storage logic
- **Supporting Multiple Storage Strategies** with consistent interfaces
- **Maintaining Flexibility** to change implementations without affecting clients

This shopping cart implementation demonstrates how the same iteration code can work seamlessly with both List and Map storage, showing the power of abstraction in creating flexible, maintainable systems.
