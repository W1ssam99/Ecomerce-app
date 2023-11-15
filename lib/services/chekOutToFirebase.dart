import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import '../models/productmodel.dart';

class ProfileRepository {
  Future<String?> getUserEmail(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

        if (userData != null && userData.containsKey('email')) {
          return userData['email'] as String?;
        }
      }
    } catch (e) {
      print('Error retrieving user email: $e');
    }

    return null;
  }

  Future<void> sendOrder(List<Products> orders) async {
    try {
      String? userEmail = await fetchUserEmail();

      if (userEmail != null) {
        await sendOrderEmail([userEmail], orders);
      } else {
        print('User email not found');
      }
    } catch (e) {
      print('Error sending order: $e');
    }
  }

  String buildOrderText(List<Products> orders) {
    String orderText = 'Order Details:\n\n';

    for (var order in orders) {
      orderText += 'Product: ${order.name}\n';
      orderText += 'Quantity: ${order.description}\n';
      orderText += 'Price: ${order.price}\n\n';
    }

    return orderText;
  }

  Future<String?> fetchUserEmail() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userData.exists) {
          String? userEmail = userData['email'];
          return userEmail;
        } else {
          print('User data not found');
        }
      } else {
        print('User is null');
      }
    } catch (e) {
      print('Error fetching user email: $e');
    }

    return null;
  }

  Future<void> sendOrderEmail(List<String> recipientEmails, List<Products> orders) async {
    String username = 'ststoremail9@gmail.com';
    String password = 'W0919643872';

    final smtpServer = gmail(username, password);

    try {
      final message = Message()
        ..from = Address(username)
        ..recipients.addAll(recipientEmails)
        ..subject = 'Order Details'
        ..text = buildOrderText(orders);

      final sendReport = await send(message, smtpServer);
      if (sendReport != null) {
        print('Message sent');
      } else {
        print('Failed to send message');
      }
    } catch (e) {
      print('Error occurred while sending email: $e');
    }
  }
}
