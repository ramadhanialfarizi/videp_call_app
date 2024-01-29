import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/utils/Constant.dart';
import 'package:video_call_app/core/utils/VColors.dart';
import 'package:video_call_app/features/home/controller/subController/MeetingsFormWidgetController.dart';

class MeetingForm extends StatelessWidget {
  final Function(String value) getInputCode;
  const MeetingForm({
    super.key,
    required this.getInputCode,
  });

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MeetingFormWidgetController(
      getInputCode: (value) {
        getInputCode(value);
      },
    ));
    return Container(
      width: double.infinity,
      height: Constant.getFullHeight(context) * 0.4,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Input Meeting Code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: VColors.redColors,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.close(1);
                },
                icon: const Icon(
                  Icons.close,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _controller.inputCodeController,
            onChanged: (value) => _controller.onTyping(),
            decoration: InputDecoration(
              hintText: 'Input code',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: _controller.showErrorMessage.value,
              child: const Text(
                "Please input meeting code",
                style: TextStyle(
                  color: VColors.redColors,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Obx(
                () => ElevatedButton(
                  onPressed: _controller.isDisableButton.value
                      ? () {}
                      : () {
                          _controller.onPressed();
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _controller.isDisableButton.value
                          ? VColors.redColorsDisable
                          : VColors.redColors,
                    ),
                  ),
                  child: const Text(
                    "Join Meetings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
