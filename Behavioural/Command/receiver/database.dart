import '../models/record.dart';

/// Database receiver - performs the actual operations
class Database {
  final List<Record> _records = [];

  /// Insert a new record
  String insert(Record record) {
    // Check if record with same ID already exists
    if (_records.any((r) => r.id == record.id)) {
      return 'Error: Record with ID ${record.id} already exists';
    }

    _records.add(record);
    return 'Record inserted successfully: ${record.toString()}';
  }

  /// Update an existing record
  String update(int id, Record newRecord) {
    final index = _records.indexWhere((r) => r.id == id);
    if (index == -1) {
      return 'Error: Record with ID $id not found';
    }

    _records[index] = newRecord;
    return 'Record updated successfully: ${newRecord.toString()}';
  }

  /// Delete a record by ID
  String delete(int id) {
    final index = _records.indexWhere((r) => r.id == id);
    if (index == -1) {
      return 'Error: Record with ID $id not found';
    }

    final deletedRecord = _records.removeAt(index);
    return 'Record deleted successfully: ${deletedRecord.toString()}';
  }

  /// Select records (simple implementation - returns all records)
  String select() {
    if (_records.isEmpty) {
      return 'No records found in database';
    }

    final buffer = StringBuffer();
    buffer.writeln('Database Records:');
    for (int i = 0; i < _records.length; i++) {
      buffer.writeln('${i + 1}. ${_records[i].toString()}');
    }
    return buffer.toString().trim();
  }

  /// Get current number of records
  int get recordCount => _records.length;
}
