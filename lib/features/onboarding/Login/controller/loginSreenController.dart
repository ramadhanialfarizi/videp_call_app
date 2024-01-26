import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/home/view/homescreen.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  signInWithGoogle(context) async {
    final googleSignInStatus = await AuthHelpers().signInGoogle();

    if (googleSignInStatus == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login fail"),
          duration: Duration(milliseconds: 800),
        ),
      );
    } else {
      Get.off(() => const HomeScreen());
    }
  }

  signInWithApple() {}
}
