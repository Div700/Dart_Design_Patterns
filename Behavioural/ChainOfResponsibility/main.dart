import 'models/email.dart';
import 'spam_detector.dart';

void main() {
  final detector = SpamDetector();
  
  // Add some user rules
  detector.userRules.addBlockedSender('annoying@example.com');
  detector.userRules.addBlockedSender('ex-boss@company.com');
  detector.userRules.addBlockedSubjectPattern('newsletter');
  detector.userRules.addBlockedSubjectPattern('promotion');

  // Test emails
  final emails = [
    // Email 1: Blocked by blacklist filter (spam domain)
    Email(
      sender: 'scammer@spam-domain.com',
      recipient: 'me@email.com',
      subject: 'Hello there',
      body: 'This is a normal looking message',
    ),
    
    // Email 2: Blocked by content filter (spam keywords)
    Email(
      sender: 'legitimate@gmail.com',
      recipient: 'me@email.com',
      subject: 'FREE MONEY CLICK HERE!!!',
      body: 'Congratulations you won a million dollars! Click here now!',
    ),
    
    // Email 3: Blocked by ML classifier (suspicious patterns)
    Email(
      sender: 'user12345@sketchy.com',
      recipient: 'me@email.com',
      subject: 'URGENT ACTION REQUIRED!!!!!!',
      body: 'Act now',
      attachments: ['suspicious.exe'],
    ),
    
    // Email 4: Blocked by user rules (blocked sender)
    Email(
      sender: 'annoying@example.com',
      recipient: 'me@email.com',
      subject: 'Hi there',
      body: 'Just a normal message from blocked sender',
    ),
    
    // Email 5: Blocked by user rules (blocked subject pattern)
    Email(
      sender: 'store@amazon.com',
      recipient: 'me@email.com',
      subject: 'Weekly Newsletter Update',
      body: 'Here are this week\'s deals and updates',
    ),
    
    // Email 6: Legitimate email (should pass all filters)
    Email(
      sender: 'friend@gmail.com',
      recipient: 'me@email.com',
      subject: 'Weekend plans',
      body: 'Hey, want to grab coffee this weekend? I found a nice new place downtown.',
    ),
    
    // Email 7: Another legitimate email
    Email(
      sender: 'boss@mycompany.com',
      recipient: 'me@email.com',
      subject: 'Meeting tomorrow',
      body: 'Just a reminder about our 2pm meeting tomorrow to discuss the quarterly report.',
    ),
  ];

  print('=== SPAM DETECTION RESULTS ===\n');
  
  for (int i = 0; i < emails.length; i++) {
    final email = emails[i];
    final isSpam = detector.isSpam(email);
    
    print('Email ${i + 1}: ${isSpam ? 'SPAM' : 'NOT SPAM'}');
    print('From: ${email.sender}');
    print('Subject: ${email.subject}');
    print('Body: ${email.body.length > 50 ? email.body.substring(0, 50) + '...' : email.body}');
    if (email.attachments.isNotEmpty) {
      print('Attachments: ${email.attachments.join(', ')}');
    }
    print('');
  }
}