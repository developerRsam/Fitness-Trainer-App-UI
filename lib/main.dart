import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}
