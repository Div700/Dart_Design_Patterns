import '../interfaces/command.dart';
import '../receiver/database.dart';

/// Concrete command for selecting records from the database
class SelectCommand implements Command {
  final Database _database;

  SelectCommand(this._database);

  @override
  String executeOperation() {
    return _database.select();
  }
}
