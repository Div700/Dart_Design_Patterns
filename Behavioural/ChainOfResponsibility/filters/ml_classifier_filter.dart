import '../interfaces/spam_filter.dart';
import '../models/email.dart';

class MlClassifierFilter extends SpamFilter {
  @override
  bool isSpam(Email email) {
    double spamScore = 0.0;

    // Check sender patterns
    if (email.sender.contains(RegExp(r'\d{5,}'))) {
      spamScore += 0.3;
    }

    // Check subject patterns
    if (email.subject.contains(RegExp(r'[!]{2,}'))) {
      spamScore += 0.2;
    }

    // Check for excessive caps
    final capsCount = email.subject.replaceAll(RegExp(r'[^A-Z]'), '').length;
    if (capsCount > email.subject.length * 0.5) {
      spamScore += 0.2;
    }

    // Check body length vs content ratio
    if (email.body.length < 50 && email.attachments.isNotEmpty) {
      spamScore += 0.3;
    }

    return spamScore >= 0.6;
  }
}
