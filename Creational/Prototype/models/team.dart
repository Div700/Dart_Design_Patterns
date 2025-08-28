import 'member.dart';
import '../abstract_team_structure/team_structure.dart';

class Team implements TeamStructure {
  String? _teamId; // id of the team
  String? _teamName; // name of the team
  // Map data structure to store all the members in the team
  Map<String, Member> _members = {};

  // Default constructor
  Team() {
    _members = <String, Member>{};
  }

  // Getters and Setters
  String? get teamName => _teamName;
  set teamName(String? teamName) => _teamName = teamName;

  String? get teamId => _teamId;
  set teamId(String? teamId) => _teamId = teamId;

  Map<String, Member> get members => _members;
  set members(Map<String, Member> members) => _members = members;

  // Method to add member
  @override
  void addMember(String name, String email, String rollNumber) {
    Member member = Member();
    member.name = name;
    member.email = email;
    member.rollNumber = rollNumber;
    _members[rollNumber] = member;
  }

  // Method to remove a member
  @override
  void removeMember(String rollNumber) {
    _members.remove(rollNumber); // removing the student from the team
  }

  // Method to display team details
  void display() {
    print('Team: $_teamName');
    print('Member Details: ');
    for (Member member in _members.values) {
      print(
        'Name: ${member.name}, Email: ${member.email}, Roll Number: ${member.rollNumber}',
      );
    }
  }

  // Deep clone method (Prototype Pattern)
  @override
  TeamStructure clone() {
    print('Cloning of the team object');
    Team clonedTeam = Team();
    clonedTeam.teamName = _teamName;
    clonedTeam.teamId = _teamId;

    // Deep cloning the map
    Map<String, Member> clonedMembers = <String, Member>{};
    _members.forEach((key, member) {
      Member clonedMember = Member();
      clonedMember.name = member.name;
      clonedMember.email = member.email;
      clonedMember.rollNumber = member.rollNumber;
      clonedMembers[key] = clonedMember;
    });

    clonedTeam.members = clonedMembers;
    return clonedTeam;
  }

  @override
  String toString() {
    return 'Team{teamName: $_teamName, members: $_members}';
  }
}
