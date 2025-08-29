import 'interfaces/browser.dart';
import 'models/extension.dart';
import 'components/browser.dart';
import 'decorators/extension_decorator.dart';
import 'decorators/style_decorator.dart';

void main() {
  print('=== CHROME BROWSER DECORATOR PATTERN ===\n');

  // Create base browser
  Browser baseBrowser = GoogleChrome();
  print('\n--- BASE BROWSER ---');
  baseBrowser.renderChrome();

  print('\n--- ADDING STYLES ---');
  // Decorate with styles
  final styledBrowser = StyleDecorator(baseBrowser);
  styledBrowser.addStyle('Dark Theme');
  styledBrowser.addStyle('Custom Fonts');
  styledBrowser.addStyle('Rounded Corners');

  styledBrowser.renderChrome();

  print('\n--- ADDING EXTENSIONS ---');
  // Decorate with extensions
  final extendedBrowser = ExtensionsDecorator(styledBrowser);

  extendedBrowser.addExtension(
    Extension(name: 'AdBlock Plus', hasAccess: true),
  );

  extendedBrowser.addExtension(
    Extension(name: 'Password Manager', hasAccess: true),
  );

  extendedBrowser.addExtension(
    Extension(name: 'Weather Widget', hasAccess: false),
  );

  print('\n--- FINAL CHROME BROWSER ---');
  extendedBrowser.renderChrome();
}
