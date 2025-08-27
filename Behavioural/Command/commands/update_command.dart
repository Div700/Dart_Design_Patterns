import '../interfaces/command.dart';
import '../receiver/database.dart';
import '../models/record.dart';

/// Concrete command for updating a record in the database
class UpdateCommand implements Command {
  final Database _database;
  final int _recordId;
  final Record _newRecord;

  UpdateCommand(this._database, this._recordId, this._newRecord);

  @override
  String executeOperation() {
    return _database.update(_recordId, _newRecord);
  }
}
