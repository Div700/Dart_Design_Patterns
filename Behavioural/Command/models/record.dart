/// Simple data model representing a database record
class Record {
  final int id;
  final String name;
  final String email;

  Record({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  String toString() {
    return 'Record(id: $id, name: $name, email: $email)';
  }

  /// Create a copy of this record with updated fields
  Record copyWith({
    int? id,
    String? name,
    String? email,
  }) {
    return Record(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
