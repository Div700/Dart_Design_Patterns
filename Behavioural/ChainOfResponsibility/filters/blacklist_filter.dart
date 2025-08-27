import '../interfaces/spam_filter.dart';
import '../models/email.dart';

class BlacklistFilter extends SpamFilter{
  @override

  bool isSpam(Email email) {
    final blacklistedDomains = _getBlacklistedDomains();
    final domain = email.senderDomain;
    return blacklistedDomains.contains(domain.toLowerCase());
  }
  Set<String> _getBlacklistedDomains() {
    return {
      'spam-domain.com',
      'fake-bank.net',
      'scam-site.org',
      'malicious.xyz',
      'phishing-site.com'
    };
  }
}