import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      content: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagesConstants.allertWarningIcon,
              width: 200,
              height: 200,
              color: VColors.redColors,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                message ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 40,
            // ),
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
        ),
      ),
    );
  }
}
