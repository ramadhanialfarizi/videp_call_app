import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/call/view/callScreen.dart';
import 'package:video_call_app/features/home/view/widget/subWidget/MeetingsFormWidget.dart';

class MeetWidgetController extends GetxController {
  TextEditingController joinController = TextEditingController();
  final AuthHelpers authHelpers = AuthHelpers();

  RxBool isLoading = false.obs;

  createNewMeeting() async {
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 500));

    isLoading.value = false;

    String roomId = "meetup-meetings/";
    Get.to(
      () => CallScreen(
        callUID: roomId,
        userID: authHelpers.userLogin.currentUser?.uid ?? "",
        userName: authHelpers.userLogin.currentUser?.email ?? "",
      ),
    );
  }

  joinToMeeting(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      context: context,
      builder: (context) => MeetingForm(
        textEditingController: joinController,
        onPressed: () async {
          Get.back();
          isLoading.value = true;

          await Future.delayed(const Duration(milliseconds: 500));

          isLoading.value = false;

          Get.to(
            () => CallScreen(
              callUID: joinController.text,
              userID: authHelpers.userLogin.currentUser?.uid ?? "",
              userName: authHelpers.userLogin.currentUser?.email ?? "",
            ),
          );
        },
      ),
    );
  }
}
