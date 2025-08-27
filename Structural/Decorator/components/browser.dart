import '../interfaces/browser.dart';

class GoogleChrome extends Browser {
  GoogleChrome() {
    print('Starting Google Chrome');
    displaySearchEngine();
  }

  @override
  void renderChrome() {
    print('-------------------------------------------');
    print('Main Chrome Browser');
  }
}