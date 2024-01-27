import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/global_widget/Loading/loadingScreenV2.dart';

import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/core/utils/VColors.dart';
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
                ImagesConstants.productIcon,
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(16.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      VColors.redColors,
                    ),
                  ),
                  onPressed: () {
                    _controller.signInWithGoogle(context);
                  },
                  icon: Image.asset(
                    ImagesConstants.googleIcon,
                    scale: 100,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.all(16.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      VColors.redColors,
                    ),
                  ),
                  onPressed: () {
                    _controller.signInWithApple(context);
                  },
                  icon: Image.asset(
                    ImagesConstants.appleIcon,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Login with Apple",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => _controller.isLoading.value
              ? const LoadingScreenv2()
              : const SizedBox(),
        ),
      ],
    ));
  }
}
