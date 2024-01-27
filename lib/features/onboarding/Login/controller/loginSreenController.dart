import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/global_widget/PopupDialog/WarningDialog.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/home/view/homescreen.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  signInWithGoogle(context) async {
    isLoading.value = true;
    final googleSignInStatus = await AuthHelpers().signInGoogle();

    try {
      if (googleSignInStatus == 'accessToken != null || idToken != null') {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("login fail"),
            duration: Duration(milliseconds: 800),
          ),
        );
      } else {
        isLoading.value = false;
        Get.off(() => const HomeScreen());
      }
    } catch (e) {
      log("error : ${e.toString()}");
      isLoading.value = false;
    }
  }

  signInWithApple(context) {
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (context) => const WarningDialog(
          message: "This features is unavailable now",
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const WarningDialog(
          message: "This features not support for your device",
        ),
      );
    }
  }
}
