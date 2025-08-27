import '../interfaces/command.dart';
import '../receiver/database.dart';
import '../models/record.dart';

/// Concrete command for inserting a record into the database
class InsertCommand implements Command {
  final Database _database;
  final Record _record;

  InsertCommand(this._database, this._record);

  @override
  String executeOperation() {
    return _database.insert(_record);
  }
}
