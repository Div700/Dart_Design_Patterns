import '../models/installation_result.dart';

/// Template Class which consists of a template method to install software and abstract methods to be implemented by concrete classes
abstract class SoftwareInstallerBase {
  
  InstallationResult install(String softwareName) {
    print('=== Installing $softwareName ===\n');
    
    InstallationResult result = InstallationResult(softwareName);
    
    try {
      // **Step 1: Download Phase**
      // Delegate to platform-specific download implementation
      result.downloadPath = downloadSoftware(softwareName);
      
      // Validate download success before proceeding
      if (result.downloadPath == null) {
        throw Exception('Download failed - no file path returned');
      }
      result.isDownloaded = true;
      
      // **Step 2: Installation Phase** 
      // Only proceed if download was successful (fail-fast principle)
      result.installMessage = installSoftware(result.downloadPath!);
      result.isInstalled = true;
      
      // **Step 3: Verification Phase**
      // Final validation that software is properly installed and accessible
      result.isVerified = verifySoftware(softwareName);
      result.isSuccessful = result.isVerified;
      
    } catch (e) {
      result.errorMessage = e.toString();
    }
    
    print(result.isSuccessful ? '\nInstallation completed!\n' : '\nInstallation failed!\n');
    return result;
  }
  
  // Abstract methods which are implemented by concrete classes
  String? downloadSoftware(String softwareName);
  String installSoftware(String filePath); 
  bool verifySoftware(String softwareName);
}