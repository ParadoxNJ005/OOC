import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pulse/BottomNav/BottomNav.dart';
import 'package:pulse/Database/notification.dart';
import 'package:pulse/Screens/EventDetail.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/MapScreen.dart';
import 'package:pulse/Screens/SignUp.dart';
import 'package:pulse/Screens/TimeLine.dart';

import 'Screens/SplashScreen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  bool permissionGranted = await requestNotificationPermission();

  if (permissionGranted) {
    // If permission granted, subscribe to topic and initialize notifications
    FirebaseMessaging.instance.subscribeToTopic('all').then((_) {
      print('Subscribed to "all" topic');
    }).catchError((error) {
      print('Failed to subscribe to topic: $error');
    });

    await FirebaseApi().initNotifications();
  } else {
    print('Notifications will not be initialized as permission is denied.');
  }

  runApp(const MyApp());
}

Future<bool> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    return true; // Permission granted
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
    return true; // Provisional permission granted, still allow notifications
  } else {
    print('User declined or has not accepted permission');
    return false; // Permission denied
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomNav(),
    );
  }
}
