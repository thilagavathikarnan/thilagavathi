import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await Firebase.initializeApp(options: FirebaseOptions(
        apiKey: "AIzaSyDwCYX3JgNAb_NgtVHtBRz1lWz8zhuJqoA",
        appId: "1:839972643243:android:b7fa45a8f77263651f32ee",
        messagingSenderId: "839972643243",
        projectId: "habit-tracker-fbe24"
    ));    await _firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    // Configure the received messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Push notification received: ${message.notification?.title}");
      // Handle the received message while the app is running
    });

    // Configure the background messages
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    // Get the device token for sending push notifications
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
  }

  Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    print("Push notification received in background: ${message.notification?.title}");
    // Handle the received message while the app is in the background
  }
}
