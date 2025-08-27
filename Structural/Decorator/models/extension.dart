class Extension {
  final String name;
  final bool hasAccess;

  Extension({required this.name, required this.hasAccess});

  void runBackground() {
    if (hasAccess) {
      print('Extension $name with browser access');
    } else {
      print('Extension $name without browser access');
    }
  }
}