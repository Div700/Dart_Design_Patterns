import 'interfaces/sheet.dart';
import 'products/maths_sheet.dart';
import 'products/english_sheet.dart';
import 'products/science_sheet.dart';

class SheetFactory {
  // Simple factory method - just returns the appropriate sheet
  static Sheet? createSheet(String subject) {
    switch (subject.toLowerCase().trim()) {
      case 'maths':
        return MathsSheet();
      case 'english':
        return EnglishSheet();
      case 'science':
        return ScienceSheet();
      default:
        print("Error: Unsupported subject '$subject'");
        print("Available subjects: maths, english, science");
        return null;
    }
  }

  static List<String> getAvailableSubjects() {
    return ['maths', 'english', 'science'];
  }
}
