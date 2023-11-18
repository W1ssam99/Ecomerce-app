import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';


class MyFunctions{
 static void sendEmail(String recipientEmail) async {
    String username = 'ststoremail9@gmail.com';
    String password = 'rrlr oqcm hcmk rmsr';

    final smtpServer = gmail(username, password);

    // Create a new email message
    final message = Message()
      ..from = Address(username, 'Your Name')
      ..recipients.add(recipientEmail) // Email address of the recipient
      ..subject = 'Flutter Email Test'
      ..text = 'This is a test email sent from Flutter.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email sent: ' + sendReport.toString() +  ' to ' + message.recipients.toString());
    } catch (e) {
      print('Error sending email: $e');
    }
  }
}