import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/call/view/callScreen.dart';
import 'package:video_call_app/features/home/view/widget/subWidget/MeetingsFormWidget.dart';

class MeetWidgetController extends GetxController {
  TextEditingController inputCodeController = TextEditingController();
  final AuthHelpers authHelpers = AuthHelpers();

  RxBool isLoading = false.obs;
  RxBool showErrorMessage = false.obs;

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
      builder: (context) => Obx(
        () => MeetingForm(
          showErrorMessage: showErrorMessage.value,
          textEditingController: inputCodeController,
          onTyping: (value) {
            if (inputCodeController.text.isEmpty) {
              showErrorMessage.value = true;
            } else {
              showErrorMessage.value = false;
            }
          },
          onPressed: () async {
            if (inputCodeController.text.isNotEmpty) {
              showErrorMessage.value = false;
              Get.back();
              isLoading.value = true;

              await checkInputCode();
              isLoading.value = false;
            } else {
              showErrorMessage.value = true;
            }
          },
        ),
      ),
    );
  }

  checkInputCode() async {
    await Future.delayed(const Duration(milliseconds: 500));

    Get.to(
      () => CallScreen(
        callUID: inputCodeController.text,
        userID: authHelpers.userLogin.currentUser?.uid ?? "",
        userName: authHelpers.userLogin.currentUser?.email ?? "",
      ),
    );
  }
}
