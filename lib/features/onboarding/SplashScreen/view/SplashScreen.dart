import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenStart();
  }

  splashScreenStart() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/loginScreen');
      // if (userLogin.currentUser == null) {
      // } else {
      //   Navigator.of(context).pushReplacementNamed('/home');
      // }

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
