import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseService {
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "YOUR_API_KEY", // Add your Firebase config
          appId: "YOUR_APP_ID",
          messagingSenderId: "YOUR_SENDER_ID",
          projectId: "YOUR_PROJECT_ID",
        ),
      );
    } catch (e) {
      print('Firebase initialization error: $e');
      // Continue app execution even if Firebase fails
    }
  }

  static Future<void> setupNotifications() async {
    try {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        final fcmToken = await FirebaseMessaging.instance.getToken();
        print('FCM Token: $fcmToken');

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
      print('Notification setup error: $e');
      // Continue app execution even if notification setup fails
    }
  }
}
