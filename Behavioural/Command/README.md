# Command Design Pattern

## What is it?
The Command pattern encapsulates a request as an object. This lets you queue operations, log requests, and support undo operations.

## Structure

```
Command/
├── interfaces/command.dart       # Command interface
├── commands/                     # Concrete commands (Insert, Update, Delete, Select)
├── receiver/database.dart        # Database that performs actual operations
├── invoker/command_invoker.dart  # Manages and executes commands
├── models/record.dart           # Data model
└── main.dart                    # Demo
```

## Key Components

- **Command Interface**: Defines `executeOperation()` method
- **Concrete Commands**: Insert, Update, Delete, Select operations
- **Receiver**: Database that does the actual work
- **Invoker**: Manages command queue and execution
- **Model**: Simple Record with id, name, email

## How it works

1. Create commands and add them to the invoker
2. Invoker executes commands without knowing their details
3. Each command calls the appropriate database method

```dart
// Create components
final database = Database();
final invoker = CommandInvoker();

// Add commands
invoker.addCommand(InsertCommand(database, record));
invoker.addCommand(SelectCommand(database));

// Execute all commands
invoker.executeAndPrintResults();
```

## Benefits

- **Decoupling**: Invoker doesn't know command details
- **Queuing**: Commands can be batched and executed later
- **Extensibility**: Easy to add new commands
- **Error Handling**: Each command handles its own errors

## Run

```bash
dart run main.dart
```