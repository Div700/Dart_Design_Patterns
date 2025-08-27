import '../interfaces/browser.dart';
import '../interfaces/browser_decorator.dart';

class StyleDecorator extends BrowserDecorator {
  final List<String> styles = [];

  StyleDecorator(Browser browser) : super(browser);

  void addStyle(String style) {
    styles.add(style);
    print('Added style: $style');
  }

  @override
  void renderChrome() {
    browser.renderChrome();
    print('Styles in your customized Chrome profile:');
    for (final style in styles) {
      print('  - $style');
    }
  }
}