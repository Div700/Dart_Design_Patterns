import '../interfaces/software_installer.dart';

/// Linux-specific implementation
class LinuxInstaller extends SoftwareInstallerBase {
  @override
  String? downloadSoftware(String softwareName) {
    try {
      print('Downloading $softwareName for Linux...');
      String filePath = '/tmp/${softwareName}.deb';
      print('Downloaded package: $filePath');
      return filePath;
    } catch (e) {
      print('Error downloading $softwareName: $e');
      return null;
    }
  }

  @override
  String installSoftware(String filePath) {
    try {
      print('Installing package: $filePath');
      String message = 'Installed via dpkg, symlink created in /usr/bin';
      print('$message');
      return message;
    } catch (e) {
      print('Error installing $filePath: $e');
      return 'Installation failed';
    }
  }

  @override
  bool verifySoftware(String softwareName) {
    try {
      print('Verifying $softwareName installation...');
      print('Command available: /usr/bin/${softwareName.toLowerCase()}');
      return true;
    } catch (e) {
      print('Error verifying $softwareName: $e');
      return false;
    }
  }
}
