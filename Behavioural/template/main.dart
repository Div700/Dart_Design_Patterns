import 'dart:io';
import 'interfaces/software_installer.dart';
import 'concrete_installers/linux_installer.dart';
import 'concrete_installers/macos_installer.dart';
import 'concrete_installers/windows_installer.dart';

void main() {
  print('Software Installation Bot\n');

  SoftwareInstallerBase installer = selectPlatform();

  // Main loop for software installation
  bool exitBot = false;
  while (!exitBot) {
    print('\n' + '=' * 50);
    print('Enter software name to install (or "0" to exit):');
    stdout.write('> ');

    String? input = stdin.readLineSync()?.trim();

    if (input == null || input.isEmpty) {
      print('Please enter a valid software name or "0" to exit.');
      continue;
    }

    if (input == '0') {
      print('\nGoodbye! Thanks for using Software Installation Bot.');
      exitBot = true;
    } else {
      var result = installer.install(input);
      print(result);
    }
  }
}

SoftwareInstallerBase selectPlatform() {
  bool isPlatformSelected = false;
  SoftwareInstallerBase? installer;
  while (!isPlatformSelected) {
    print('Select platform for installation:');
    print('1. macOS');
    print('2. Windows');
    print('3. Linux');
    stdout.write('Enter your choice (1-3): ');

    String? choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        print('Selected: macOS\n');
        installer = MacOSInstaller();
        isPlatformSelected = true;

      case '2':
        print('Selected: Windows\n');
        installer = WindowsInstaller();
        isPlatformSelected = true;

      case '3':
        print('Selected: Linux\n');
        installer = LinuxInstaller();
        isPlatformSelected = true;

      default:
        print('Invalid choice. Please enter 1, 2, or 3.\n');
    }
  }
  return installer!;
}
