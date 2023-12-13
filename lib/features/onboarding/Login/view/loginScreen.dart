import 'package:flutter/material.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesConstants.appIcon,
            scale: 3,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.all(16.0),
              ),
            ),
            onPressed: () {},
            icon: Image.asset(
              ImagesConstants.googleIcon,
              scale: 100,
            ),
            label: Text("Login with Google"),
          ),
        ],
      ),
    ));
  }
}
