import 'package:flutter/material.dart';
import 'package:video_call_app/core/utils/VColors.dart';

class LoadingScreenv2 extends StatelessWidget {
  const LoadingScreenv2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.7),
      body: Center(
        child: CircularProgressIndicator(
          color: VColors.redColors,
        ),
      ),
    );
  }
}
