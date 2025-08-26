/// Model to track installation progress and results
class InstallationResult {
  final String softwareName;
  String? downloadPath;
  String? installMessage;
  bool isDownloaded = false;
  bool isInstalled = false;
  bool isVerified = false;
  bool isSuccessful = false;
  String? errorMessage;

  InstallationResult(this.softwareName);

  @override
  String toString() {
    return ''' Installation Report for $softwareName:
   • Downloaded: Status: ${isDownloaded ? 'Success' : 'Failed'} ${downloadPath ?? ''}
   • Installed: Status: ${isInstalled ? 'Success' : 'Failed'} ${installMessage ?? ''}
   • Verified: Status: ${isVerified ? 'Success' : 'Failed'}
   • Overall Status: ${isSuccessful ? 'Success' : 'Failed'}
   ${errorMessage != null ? '• Error: $errorMessage' : ''}
''';
  }
}
