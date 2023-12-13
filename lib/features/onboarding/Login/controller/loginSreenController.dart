import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/utils/generalUtility.dart';
import 'package:video_call_app/features/home/view/homescreen.dart';

class LoginScreenController extends GetxController {
  signInWithGoogle(context) async {
    try {
      await GeneralUtility().signInGoogle();
      Get.to(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: const Duration(milliseconds: 800),
        ),
      );
    }
  }
}
