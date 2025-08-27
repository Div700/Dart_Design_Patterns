import '../interfaces/spam_filter.dart';
import '../models/email.dart';

class UserRulesFilter extends SpamFilter {
  final Set<String> _blockedSenders = <String>{};
  final Set<String> _blockedSubjectPatterns = <String>{};

  void addBlockedSender(String sender) {
    _blockedSenders.add(sender.toLowerCase());
  }

  void addBlockedSubjectPattern(String pattern) {
    _blockedSubjectPatterns.add(pattern.toLowerCase());
  }

  @override
  bool isSpam(Email email) {
    // Check blocked senders
    if (_blockedSenders.contains(email.sender.toLowerCase())) {
      return true;
    }

    // Check subject patterns
    final subject = email.subject.toLowerCase();
    return _blockedSubjectPatterns.any((pattern) => subject.contains(pattern));
  }
}