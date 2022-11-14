import 'package:flutter/material.dart';
import 'package:tiktok_test/constants.dart';
import 'package:tiktok_test/views/screens/auth/login_screen.dart';
import 'package:tiktok_test/views/screens/auth/signup_screen.dart';

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
      title: 'Tiktok test',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home:  SignupScreen(),//LoginScreen(),
    );
  }
}

