// ignore_for_file: use_super_parameters, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:myapp/homepage.dart';
import 'package:myapp/splashscreen.dart';
import 'dart:math' as math;
import 'package:myapp/slider.dart';

import 'prime.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String logoPath =
      'assets/logo/Coin.png';

  final Color primaryColor = const Color(0xFF0A1F44);

  void _handleAnimationComplete(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        useMaterial3: true,
      ),
      home: TechSplashScreen(
        logoPath: logoPath,
        primaryColor: primaryColor,
        onAnimationComplete: (context) => _handleAnimationComplete(context),
      ),
    );
  }
}
