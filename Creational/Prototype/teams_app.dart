import 'dart:io';

import 'models/team.dart';

void main() async {
  // Map to store all microsoft teams with their ID as the key
  Map<String, Team> allTeams = <String, Team>{};

  // Team object t
  Team? t;
  int choice = 1;

  // Loop until user decides to exit application
  while (choice != 3) {
    print('Enter 1 to create a general division team');
    print('Enter 2 to create a common subject team');
    print('Enter 3 to quit the applicati1on');

    String? input = stdin.readLineSync();
    choice = int.tryParse(input ?? '') ?? 0;

    switch (choice) {
      case 1:
        // Creating a new general division team
        t = Team();
        print('Enter the name of general division team class');
        String? name = stdin.readLineSync();
        print('Enter the id of general division team class');
        String? id = stdin.readLineSync();

        t.teamName = name;
        t.teamId = id;

        // Adding members to the created general team
        print('Enter the number of members for this team: ');
        String? memberCountInput = stdin.readLineSync();
        int numberOfMembers = int.tryParse(memberCountInput ?? '') ?? 0;

        // Adding members in the team
        for (int i = 1; i <= numberOfMembers; i++) {
          print('Enter student $i name:');
          String? studentName = stdin.readLineSync();
          print('Enter student $i roll number:');
          String? rollNumber = stdin.readLineSync();
          print('Enter student $i email:');
          String? email = stdin.readLineSync();

          t.addMember(studentName ?? '', email ?? '', rollNumber ?? '');
        }

        print('Team created successfully');
        allTeams[id ?? ''] = t;
        print('Team details: ${t.toString()}');
        break;

      case 2:
        // Creating a common subject team by cloning an existing team
        print('Enter the team id whose common teams is to be created: ');
        String? id = stdin.readLineSync();
        Team? commonTeam;
        t = allTeams[id];

        if (t == null) {
          // If no such team exists then show error and continue
          print('No such team exists');
          continue;
        }

        // Cloning the main team object instead of creating a new one
        commonTeam = t.clone();
        print('Enter the name of common team class');
        String? name = stdin.readLineSync();
        print('Enter the id of common team class');
        id = stdin.readLineSync();

        commonTeam.teamName = name;
        commonTeam.teamId = id;

        print(
          'Do you want to remove any members from this team: Enter true or false',
        );
        String? removeInput = stdin.readLineSync();
        bool isRemove = removeInput?.toLowerCase() == 'true';

        if (isRemove) {
          // Option to remove members from the cloned team
          print('Enter the number of members to be removed: ');
          String? removeCountInput = stdin.readLineSync();
          int toBeRemoved = int.tryParse(removeCountInput ?? '') ?? 0;

          for (int i = 1; i <= toBeRemoved; i++) {
            print('Enter the id to be removed: ');
            String? removeId = stdin.readLineSync();
            commonTeam.removeMember(removeId ?? '');
          }
        }

        print('Team created successfully');
        // Storing the newly created team in map of all teams
        allTeams[id ?? ''] = commonTeam;
        print('Team details: ${commonTeam.toString()}');
        break;

      case 3:
        print('Thank you for using teams!!');
        break;

      default:
        print('WRONG CHOICE');
    }
  }

  // Displaying all teams before quitting the application
  print('-----All team details-----');
  for (Team teams in allTeams.values) {
    teams.display();
  }
}
