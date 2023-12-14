import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/global_widget/loadingScreen.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/features/onboarding/Login/controller/loginSreenController.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(LoginScreenController());
    return Scaffold(
        body: Stack(
      children: [
        Center(
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
                onPressed: () {
                  _controller.signInWithGoogle(context);
                },
                icon: Image.asset(
                  ImagesConstants.googleIcon,
                  scale: 100,
                ),
                label: const Text("Login with Google"),
              ),
            ],
          ),
        ),
        Obx(
          () => _controller.isLoading.value
              ? const LoadingScreen()
              : const SizedBox(),
        ),
      ],
    ));
  }
}
