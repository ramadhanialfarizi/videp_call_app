import 'package:flutter/material.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.7),
      body: Center(
        child: Image.asset(
          ImagesConstants.appIconsGift,
          scale: 5,
        ),
      ),
    );
  }
}
