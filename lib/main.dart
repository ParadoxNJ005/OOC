import 'package:flutter/material.dart';
import 'package:pulse/Screens/EventDetail.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/MapScreen.dart';
import 'package:pulse/Screens/SignUp.dart';
import 'package:pulse/Screens/TimeLine.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Mapscreen(),
    );
  }
}
