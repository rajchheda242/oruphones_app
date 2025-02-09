import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  static Future<void> setupNotifications() async {
    try {
      final status = await Permission.notification.request();

      if (status.isGranted) {
        final messaging = FirebaseMessaging.instance;
        final token = await messaging.getToken();
        print('FCM Token: $token');

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          print('Got a message whilst in the foreground!');
          print('Message data: ${message.data}');

          if (message.notification != null) {
            print(
                'Message also contained a notification: ${message.notification}');
          }
        });
      }
    } catch (e) {
      print('Error setting up notifications: $e');
    }
  }
}
