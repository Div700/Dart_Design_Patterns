import '../models/email.dart';

abstract class SpamFilter {
  SpamFilter? _nextFilter;

  bool checkSpam(Email email) {
    bool isEmailSpam = isSpam(email);
    if (isEmailSpam) {
      return true;
    } else {
      if (_nextFilter != null) {
        return _nextFilter!.checkSpam(email);
      } else {
        return isEmailSpam;
      }
    }
  }

  void setNext(SpamFilter? nextFilter) {
    _nextFilter = nextFilter;
  }

  bool isSpam(Email email);
}
