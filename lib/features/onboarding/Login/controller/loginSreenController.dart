import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/global_widget/PopupDialog/WarningDialog.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/home/view/homescreen.dart';
import 'package:video_call_app/repository/onBoardingRepository/ViewDataModel/onBoardingDM.dart';
import 'package:video_call_app/repository/onBoardingRepository/onBoardingRepository.dart';

class LoginScreenController extends GetxController {
  RxBool isLoading = false.obs;

  signInWithGoogle(context) async {
    isLoading.value = true;
    OnBoardingDM? onBoardingDM;

    final googleSignInStatus = await OnBoardingRepository().loginWithGoogle();

    onBoardingDM = googleSignInStatus;

    if (onBoardingDM.isError ?? false) {
      isLoading.value = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${onBoardingDM.errorMessage}"),
          duration: const Duration(milliseconds: 800),
        ),
      );
    } else {
      isLoading.value = false;
      Get.offAll(() => const HomeScreen());
    }
  }

  signInWithApple(context) {
    if (Platform.isIOS) {
      Get.dialog(
        const WarningDialog(
          message: "This features is unavailable now",
        ),
      );
    } else {
      Get.dialog(
        const WarningDialog(
          message: "This features is not support for your device",
        ),
      );
    }
  }
}
