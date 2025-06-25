class Member {
  String? _name; // name of the member
  String? _email; // email of the member
  String? _rollNumber; // roll number of the member

  // Getters
  String? get name => _name;
  String? get email => _email;
  String? get rollNumber => _rollNumber;

  // Setters
  set name(String? name) => _name = name;
  set email(String? email) => _email = email;
  set rollNumber(String? rollNumber) => _rollNumber = rollNumber;

  @override
  String toString() {
    return 'Member{name: $_name, email: $_email, rollNumber: $_rollNumber}';
  }
}
