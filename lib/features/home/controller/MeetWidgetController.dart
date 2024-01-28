// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/call/view/callScreen.dart';
import 'package:video_call_app/features/home/view/widget/subWidget/MeetingsFormWidget.dart';

class MeetWidgetController extends GetxController {
  final AuthHelpers authHelpers = AuthHelpers();

  RxBool isLoading = false.obs;
  RxBool showErrorMessage = false.obs;

  createNewMeeting() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    isLoading.value = false;

    int idRoom = randomIdRoom(1, 30);

    String roomId = "meetup-meetings-idRoom-$idRoom";

    Get.to(
      () => CallScreen(
        callUID: roomId,
        userID: authHelpers.userLogin.currentUser?.uid ?? "",
        userName: authHelpers.userLogin.currentUser?.email ?? "",
      ),
    );
  }

  joinToMeeting(context) {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      MeetingForm(
        getInputCode: (code) async {
          Get.back();
          isLoading.value = true;
          await checkInputCode(code);
          isLoading.value = false;
        },
      ),
    );
  }

  randomIdRoom(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  checkInputCode(String roomCode) async {
    await Future.delayed(const Duration(milliseconds: 500));

    Get.to(
      () => CallScreen(
        callUID: roomCode,
        userID: authHelpers.userLogin.currentUser?.uid ?? "",
        userName: authHelpers.userLogin.currentUser?.email ?? "",
      ),
    );
  }
}
