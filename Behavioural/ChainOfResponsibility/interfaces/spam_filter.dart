import '../models/email.dart';

/* This is the abstract class which defines the interface for all of the handlers. The method isSpam is overridden by the concrete handlers. */
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
