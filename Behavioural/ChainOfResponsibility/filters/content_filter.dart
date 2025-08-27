import '../interfaces/spam_filter.dart';
import '../models/email.dart';

class ContentFilter extends SpamFilter {
  @override
  bool isSpam(Email email) {
    final Set<String> blacklistedWords = _getBlacklistedWords();
    final String subject = email.subject.toLowerCase();
    final String body = email.body.toLowerCase();
    final Set<String> words = {...subject.split(' '), ...body.split(' ')};
    return words.any((word) => blacklistedWords.contains(word));
  }

  Set<String> _getBlacklistedWords() {
    return {
      'free money',
      'click here',
      'urgent action required',
      'congratulations you won',
      'nigerian prince',
      'suspicious activity',
      'verify account',
      'limited time offer',
    };
  }
}
