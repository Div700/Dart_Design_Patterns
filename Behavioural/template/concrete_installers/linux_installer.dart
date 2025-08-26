import '../interfaces/software_installer.dart';

/// Linux-specific implementation
class LinuxInstaller extends SoftwareInstallerBase {

  @override
  String? downloadSoftware(String softwareName) {
    print('Downloading $softwareName for Linux...');
    String filePath = '/tmp/${softwareName}.deb';
    print('Downloaded package: $filePath');
    return filePath;
  }

  @override
  String installSoftware(String filePath) {
    print('Installing package: $filePath');
    String message = 'Installed via dpkg, symlink created in /usr/bin';
    print('$message');
    return message;
  }

  @override
  bool verifySoftware(String softwareName) {
    print('Verifying $softwareName installation...');
    print('Command available: /usr/bin/${softwareName.toLowerCase()}');
    return true;
  }
}
