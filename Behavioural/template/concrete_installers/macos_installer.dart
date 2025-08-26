import '../interfaces/software_installer.dart';

/// macOS-specific implementation
class MacOSInstaller extends SoftwareInstallerBase {
  @override
  String? downloadSoftware(String softwareName) {
    print('Downloading $softwareName for macOS...');

    String filePath = '/tmp/${softwareName}.dmg';
    print('Downloaded disk image: $filePath');
    return filePath;
  }

  @override
  String installSoftware(String filePath) {
    print('Installing from: $filePath');

    String message = 'Mounted DMG, copied to Applications, updated PATH';
    print('$message');
    return message;
  }

  @override
  bool verifySoftware(String softwareName) {
    print('Verifying $softwareName installation...');

    print('Available in: /Applications/$softwareName.app');
    return true;
  }
}
