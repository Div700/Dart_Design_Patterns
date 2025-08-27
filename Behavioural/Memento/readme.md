# Auto-Checkpoint Game System - Memento Design Pattern

A comprehensive implementation of the Memento design pattern demonstrating automatic checkpoint system for game state management in Dart.

## Overview

This project showcases the Memento pattern through a game checkpoint system where player progress is automatically saved at critical moments and can be restored when needed (e.g., player death, boss fights). The implementation strictly follows the Memento pattern's three-component architecture.

## Memento Pattern Components

### 1. Originator (GameStateOriginator)
- **Role**: Creates and manages game state
- **Responsibilities**: 
  - Creates mementos of current state
  - Restores state from mementos
  - Handles game logic (movement, combat, leveling)
- **Knowledge**: Only knows about its own state, not storage

### 2. Memento (CheckpointMemento)
- **Role**: Immutable snapshot of game state
- **Responsibilities**:
  - Stores player data at specific moment
  - Preserves timestamp and checkpoint reason
  - Provides state restoration data
- **Knowledge**: Only contains state data, no logic

### 3. Caretaker (CheckpointCaretaker)
- **Role**: Manages memento storage and retrieval
- **Responsibilities**:
  - Decides when to create checkpoints
  - Stores and organizes mementos
  - Handles restoration logic
  - Manages auto-checkpoint triggers
- **Knowledge**: Manages mementos but doesn't access their internal data

## Project Structure

```
lib/
├── models/
│   └── player.dart                  # Player data model
├── memento/
│   └── checkpoint_memento.dart      # Memento implementation
├── game_state_originator.dart       # Originator implementation
└── checkpoint_caretaker.dart        # Caretaker implementation

example/
└── memento_pattern_demo.dart        # Pattern demonstration

README.md                            # This documentation
```

## Key Features

### Auto-Checkpoint Triggers
- **Boss Encounters**: Save before dangerous fights
- **Level Progression**: Preserve progress after level ups
- **Area Transitions**: Create checkpoints when entering new zones
- **Death Recovery**: Automatic restoration on player death

### State Management
- **Player Progress**: Level, health, experience tracking
- **Position Tracking**: X, Y coordinates preservation
- **Timestamp Recording**: When checkpoints were created
- **Reason Logging**: Why each checkpoint was created

### Restoration System
- **Last Checkpoint**: Quick restore to most recent save
- **Specific Checkpoint**: Restore to any previous save point
- **Validation**: Proper error handling for invalid restores

## Usage Example

```dart
// Create game components
final player = Player(name: 'Hero', level: 1, health: 100, x: 0.0, y: 0.0);
final gameOriginator = GameStateOriginator(player: player);
final checkpointManager = CheckpointCaretaker(gameOriginator);

// Play game - auto-checkpoints trigger automatically
gameOriginator.moveTo(10.0, 15.0);
checkpointManager.autoSaveAreaTransition('Forest');

gameOriginator.levelUp();
checkpointManager.autoSaveAfterLevelUp();

// Handle player death - automatic restoration
if (gameOriginator.isPlayerDead()) {
    checkpointManager.handlePlayerDeath();
}
```

## Running the Demo

```bash
dart run example/memento_pattern_demo.dart
```

## Sample Output

```
=== MEMENTO PATTERN: AUTO CHECKPOINT DEMO ===

--- STARTING GAME ---
Current: Hero (Lv.1, HP:100) at (0.0, 0.0)

--- EXPLORING WORLD ---
Moved to (10.0, 15.0)
ORIGINATOR: Creating memento - Entered Forest
CARETAKER: Checkpoint saved - Entered Forest

Leveled up to 2
ORIGINATOR: Creating memento - After Level Up
CARETAKER: Checkpoint saved - After Level Up

--- BOSS FIGHT ---
Took 30 damage. Health: 70
Took 50 damage. Health: 20
Took 50 damage. Health: -30

CARETAKER: Player died! Attempting restore...
ORIGINATOR: Restoring from memento - Before Boss Fight
CARETAKER: Restored to last checkpoint

--- AFTER RESTORATION ---
Current: Hero (Lv.2, HP:100) at (50.0, 50.0)
```

## Design Pattern Benefits

### Separation of Concerns
- **Originator**: Focuses solely on game state management
- **Caretaker**: Handles all checkpoint logic and storage
- **Memento**: Pure data container with no business logic

### Encapsulation
- Game state internals are hidden from caretaker
- Memento provides controlled access to saved state
- Clean interfaces between all components

### Flexibility
- Easy to add new checkpoint triggers
- Simple to modify restoration logic
- Extensible for different types of save states

## Real-World Applications

This pattern is essential in:

### Gaming Industry
- **Save/Load Systems**: Player progress preservation
- **Undo/Redo**: Level editors and game development tools
- **Checkpoint Systems**: Automatic progress saving
- **State Rollback**: Network game synchronization

### Software Development
- **Version Control**: Git commits as mementos
- **Database Transactions**: Rollback capabilities
- **Text Editors**: Undo/redo functionality
- **Configuration Management**: Settings snapshots

### System Design
- **Backup Systems**: State preservation
- **Workflow Management**: Process checkpointing
- **Error Recovery**: System state restoration

## Implementation Highlights

### Proper Pattern Implementation
- **No State Leakage**: Caretaker never accesses memento internals
- **Immutable Mementos**: State snapshots cannot be modified
- **Clear Responsibilities**: Each component has single purpose

### Game-Specific Features
- **Auto-Triggering**: Intelligent checkpoint creation
- **Context Awareness**: Different triggers for different scenarios
- **Recovery Logic**: Automatic restoration on failure

### Performance Considerations
- **Efficient Storage**: Only essential state data preserved
- **Memory Management**: Limited checkpoint history
- **Fast Restoration**: Quick state recovery

## Testing Strategy

Each component can be tested independently:

```dart
// Test Originator
final originator = GameStateOriginator(player: testPlayer);
final memento = originator.createMemento('Test');
originator.restoreFromMemento(memento);

// Test Caretaker
final caretaker = CheckpointCaretaker(originator);
caretaker.saveCheckpoint('Test Save');
caretaker.restoreLastCheckpoint();

// Test Memento
final memento = CheckpointMemento(...);
final restoredPlayer = memento.toPlayer();
```

## Extension Possibilities

- **Multiple Save Slots**: Named checkpoint categories
- **Checkpoint Branching**: Tree-like save structure
- **Compressed Storage**: Efficient memory usage for large states
- **Cloud Integration**: Remote checkpoint storage
- **Metadata Enhancement**: Additional checkpoint information

## Requirements

- Dart SDK 2.17.0 or higher

## Getting Started

1. Clone the repository
2. Navigate to the project directory
3. Run the demonstration:
   ```bash
   dart run example/memento_pattern_demo.dart
   ```

## Design Pattern Category

**Behavioral Design Pattern** - Focuses on communication between objects and the assignment of responsibilities, specifically managing object state history and restoration capabilities.

## License

This project is created for educational purposes to demonstrate the Memento design pattern implementation in game development contexts.
