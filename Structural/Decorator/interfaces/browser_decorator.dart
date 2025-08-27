import 'browser.dart';

abstract class BrowserDecorator extends Browser {
  final Browser browser;

  BrowserDecorator(this.browser);
}