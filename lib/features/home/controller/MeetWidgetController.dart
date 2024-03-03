// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/global_widget/PopupDialog/WarningDialog.dart';

import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/core/utils/GeneralUtility.dart';
import 'package:video_call_app/features/call/view/callScreen.dart';
import 'package:video_call_app/features/home/view/widget/subWidget/MeetingsFormWidget.dart';
import 'package:video_call_app/repository/meetingRepository/Request/createMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Request/joinMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/VIewDataModel/joinMeetingListDM.dart';
import 'package:video_call_app/repository/meetingRepository/VIewDataModel/meetingDM.dart';
import 'package:video_call_app/repository/meetingRepository/meetingRepository.dart';

class MeetWidgetController extends GetxController {
  final AuthHelpers authHelpers = AuthHelpers();

  RxBool isLoading = false.obs;
  RxBool showErrorMessage = false.obs;

  createNewMeeting() async {
    isLoading.value = true;
    int idRoomCode = GeneralUtility().randomIdCode(1, 30);
    String roomId = "meetup-meetings-$idRoomCode";

    CreateMeetingRequestModel param = CreateMeetingRequestModel()
      ..idRoom = roomId;

    MeetingDM createRoom = await MeetingRepository().createMeetingRoom(param);
    await Future.delayed(const Duration(milliseconds: 500));

    if (createRoom.isError == false) {
      isLoading.value = false;
      Get.to(
        () => CallScreen(
          callUID: roomId,
          userID: authHelpers.userLogin.currentUser?.uid ?? "",
          userName: authHelpers.userLogin.currentUser?.email ?? "",
        ),
      );
    } else {
      isLoading.value = false;
      Get.dialog(
        WarningDialog(
          message: "fail to create room : ${createRoom.errorMessage}",
        ),
      );
    }
  }

  joinToMeeting(context) {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      MeetingForm(
        getInputCode: (code) async {
          Get.back();
          await checkInputCode(code);
        },
      ),
    );
  }

  checkInputCode(String roomCode) async {
    isLoading.value = true;

    JoinMeetingRequestModel param = JoinMeetingRequestModel()
      ..meetingRoomId = roomCode;

    JoinMeetingListDM joinMeetingListDM =
        await MeetingRepository().joinMeetingRoom(param);

    await Future.delayed(const Duration(milliseconds: 500));

    if (joinMeetingListDM.isError ?? false) {
      isLoading.value = false;
      Get.dialog(
        WarningDialog(
          message: "fail join to room : ${joinMeetingListDM.errorMessage}",
        ),
      );
    } else {
      if ((joinMeetingListDM.listMeetingData ?? []).isNotEmpty) {
        isLoading.value = false;
        Get.to(
          () => CallScreen(
            callUID: roomCode,
            userID: authHelpers.userLogin.currentUser?.uid ?? "",
            userName: authHelpers.userLogin.currentUser?.email ?? "",
          ),
        );
      } else {
        isLoading.value = false;
        Get.dialog(
          const WarningDialog(
            message: "Room not found",
          ),
        );
      }
    }
  }
}
