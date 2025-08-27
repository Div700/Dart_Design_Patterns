import '../interfaces/command.dart';

/// Command Invoker - manages and executes commands
/// The invoker doesn't know about the concrete command implementations
class CommandInvoker {
  final List<Command> _commands = [];

  /// Add a command to the queue
  void addCommand(Command command) {
    _commands.add(command);
  }

  /// Execute all commands in the queue and return results
  List<String> executeAllCommands() {
    final List<String> results = [];
    
    for (final command in _commands) {
      try {
        final result = command.executeOperation();
        results.add(result);
      } catch (e) {
        results.add('Error executing command: $e');
      }
    }
    
    return results;
  }

  /// Execute all commands and print results
  void executeAndPrintResults() {
    print('Executing ${_commands.length} command(s)...\n');
    
    final results = executeAllCommands();
    for (int i = 0; i < results.length; i++) {
      print('Command ${i + 1} result:');
      print(results[i]);
      print('${'-' * 50}');
    }
  }

  /// Clear all commands from the queue
  void clearCommands() {
    _commands.clear();
  }

  /// Get the number of commands in the queue
  int get commandCount => _commands.length;

  /// Check if there are any commands in the queue
  bool get hasCommands => _commands.isNotEmpty;
}
