class Email {
  String _sender;
  String _recipient;
  String _subject;
  String _body;
  List<String> _attachments;

  Email({
    required String sender,
    required String recipient,
    required String subject,
    required String body,
    List<String>? attachments,
  }) : _sender = sender,
       _recipient = recipient,
       _subject = subject,
       _body = body,
       _attachments = attachments ?? [];

  String get sender => _sender;
  String get recipient => _recipient;
  String get subject => _subject;
  String get body => _body;
  List<String> get attachments => _attachments;

  String get senderDomain {
    final atIndex = _sender.indexOf('@');
    return atIndex != -1 ? _sender.substring(atIndex + 1) : '';
  }
}
