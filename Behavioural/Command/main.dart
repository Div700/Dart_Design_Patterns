import 'receiver/database.dart';
import 'models/record.dart';
import 'commands/insert_command.dart';
import 'commands/update_command.dart';
import 'commands/delete_command.dart';
import 'commands/select_command.dart';
import 'invoker/command_invoker.dart';

/// Demonstration of the Command Design Pattern with Database Operations
void main() {
  // Create the receiver (Database)
  final database = Database();

  // Create the invoker
  final invoker = CommandInvoker();

  // Create sample records
  final record1 = Record(id: 1, name: 'John Doe', email: 'john@example.com');
  final record2 = Record(id: 2, name: 'Jane Smith', email: 'jane@example.com');
  final record3 = Record(id: 3, name: 'Bob Johnson', email: 'bob@example.com');

  print('>>> Setting up commands for batch execution...\n');

  // Create and add commands to the invoker
  // The invoker doesn't know about the specific command implementations
  invoker.addCommand(InsertCommand(database, record1));
  invoker.addCommand(InsertCommand(database, record2));
  invoker.addCommand(InsertCommand(database, record3));
  invoker.addCommand(SelectCommand(database));

  print('Added ${invoker.commandCount} commands to the queue.');
  print('Executing first batch of commands...\n');

  // Execute all commands
  invoker.executeAndPrintResults();

  // Clear the command queue for next batch
  invoker.clearCommands();

  print('\n>>> Setting up update and delete operations...\n');

  // Add more commands for update and delete operations
  final updatedRecord = Record(
    id: 2,
    name: 'Jane Wilson',
    email: 'jane.wilson@example.com',
  );

  invoker.addCommand(UpdateCommand(database, 2, updatedRecord));
  invoker.addCommand(DeleteCommand(database, 3));
  invoker.addCommand(SelectCommand(database));

  print('Added ${invoker.commandCount} more commands to the queue.');
  print('Executing second batch of commands...\n');

  // Execute the second batch
  invoker.executeAndPrintResults();

  print('\n>>> Testing error scenarios...\n');

  // Clear and add commands that will trigger errors
  invoker.clearCommands();

  // Try to insert duplicate record
  invoker.addCommand(
    InsertCommand(database, record1),
  ); // Should fail - duplicate ID

  // Try to update non-existent record
  invoker.addCommand(
    UpdateCommand(database, 999, record1),
  ); // Should fail - ID not found

  // Try to delete non-existent record
  invoker.addCommand(
    DeleteCommand(database, 999),
  ); // Should fail - ID not found

  invoker.addCommand(SelectCommand(database)); // Should show final state

  print('Added ${invoker.commandCount} commands (including error cases).');
  print('Executing final batch...\n');

  invoker.executeAndPrintResults();
}
