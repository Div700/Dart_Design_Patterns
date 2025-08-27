import 'filters/user_rule_filter.dart';
import 'models/email.dart';
import 'filters/blacklist_filter.dart';
import 'filters/content_filter.dart';
import 'filters/ml_classifier_filter.dart';

class SpamDetector {
  late final BlacklistFilter _blacklistFilter;
  late final ContentFilter _contentFilter;
  late final MlClassifierFilter _mlFilter;
  late final UserRulesFilter _userRulesFilter;

  SpamDetector() {
    _blacklistFilter = BlacklistFilter();
    _contentFilter = ContentFilter();
    _mlFilter = MlClassifierFilter();
    _userRulesFilter = UserRulesFilter();

    // Set up the chain
    _blacklistFilter.setNext(_contentFilter);
    _contentFilter.setNext(_mlFilter);
    _mlFilter.setNext(_userRulesFilter);
  }

  bool isSpam(Email email) {
    return _blacklistFilter.checkSpam(email);
  }

  UserRulesFilter get userRules => _userRulesFilter;
}