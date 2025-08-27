import '../interfaces/command.dart';
import '../receiver/database.dart';

/// Concrete command for deleting a record from the database
class DeleteCommand implements Command {
  final Database _database;
  final int _recordId;

  DeleteCommand(this._database, this._recordId);

  @override
  String executeOperation() {
    return _database.delete(_recordId);
  }
}
