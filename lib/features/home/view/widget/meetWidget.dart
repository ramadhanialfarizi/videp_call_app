import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_call_app/core/global_widget/loadingScreenV2.dart';
import 'package:video_call_app/core/utils/VColors.dart';
import 'package:video_call_app/features/home/controller/MeetWidgetController.dart';

class MeetWidget extends StatelessWidget {
  const MeetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MeetWidgetController());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _controller.createNewMeeting(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          VColors.redColors,
                        ),
                      ),
                      child: const Text(
                        "New Meetings",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _controller.joinToMeeting(context),
                      child: const Text(
                        "join Meetings",
                        style: TextStyle(
                          color: VColors.redColors,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Obx(() => _controller.isLoading.value
            ? const LoadingScreenv2()
            : const SizedBox())
      ],
    );
  }
}
