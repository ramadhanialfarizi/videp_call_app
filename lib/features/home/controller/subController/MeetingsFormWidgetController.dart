import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeetingFormWidgetController extends GetxController {
  TextEditingController inputCodeController = TextEditingController();

  RxBool showErrorMessage = false.obs;
  RxBool isDisableButton = true.obs;

  final Function(String value) getInputCode;

  MeetingFormWidgetController({
    required this.getInputCode,
  });

  @override
  void onClose() {
    inputCodeController.dispose();

    Get.delete<MeetingFormWidgetController>();
    super.onClose();
  }

  onTyping() {
    if (inputCodeController.text.isEmpty) {
      showErrorMessage.value = true;
      isDisableButton.value = true;
    } else {
      showErrorMessage.value = false;
      isDisableButton.value = false;
    }
  }

  onPressed() {
    getInputCode(inputCodeController.text);
  }
}
