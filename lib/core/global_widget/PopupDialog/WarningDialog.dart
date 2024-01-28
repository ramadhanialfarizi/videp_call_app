import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/utils/Constant.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/core/utils/VColors.dart';

class WarningDialog extends StatelessWidget {
  final String? message;
  const WarningDialog({
    super.key,
    this.message = "is not support",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Image.asset(
        ImagesConstants.allertWarningIcon,
        width: Constant.getFullWidth(context) * 0.3,
        height: Constant.getFullHeight(context) * 0.2,
        color: VColors.redColors,
      ),
      titleTextStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      title: Text(
        message ?? "",
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              VColors.redColors,
            ),
          ),
          child: const Text(
            "ok",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
