import '../interfaces/browser.dart';
import '../interfaces/browser_decorator.dart';
import '../models/extension.dart';

class ExtensionsDecorator extends BrowserDecorator {
  final List<Extension> extensions = [];

  ExtensionsDecorator(Browser browser) : super(browser);

  void addExtension(Extension extension) {
    extensions.add(extension);
    print('Chrome extension ${extension.name} added successfully');
  }

  @override
  void renderChrome() {
    browser.renderChrome();
    if (extensions.isNotEmpty) {
      print('Extensions running in background:');
      for (final extension in extensions) {
        extension.runBackground();
      }
    }
    print('-------------------------------------------');
  }
}