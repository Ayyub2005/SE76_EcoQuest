import 'package:flutter/material.dart';
import 'views/camera_view.dart';
import 'splash.dart';
import 'homescreen.dart';
import 'character_customization.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      // Define initial route for loading the first screen
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const PageOne(),
        '/homescreen': (context) => const HomeScreen(), // Use HomeScreen from Page2
        '/character_customization': (context) => Character_cust(), // Use HomeScreen from Page3
        '/cameraview': (context) => const CameraView(),
      },
    );
  }
}

