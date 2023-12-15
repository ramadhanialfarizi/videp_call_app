import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthHelpers authHelpers = AuthHelpers();

  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      if (authHelpers.userLogin.currentUser == null) {
        Navigator.of(context).pushReplacementNamed('/loginScreen');
      } else {
        Navigator.of(context).pushReplacementNamed('/homeScreen');
      }

      //Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImagesConstants.appIconsGift,
          scale: 3,
        ),
      ),
    );
  }
}
