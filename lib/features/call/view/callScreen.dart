// ignore: file_names
import 'package:flutter/material.dart';
import 'package:video_call_app/features/call/view/widget/share_button.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../../../core/utils/env.dart';

class CallScreen extends StatelessWidget {
  const CallScreen(
      {super.key,
      required this.callUID,
      required this.userID,
      required this.userName});
  final String callUID;
  final String userID;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID:
            zegoCloudAppID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign:
            zegoCloudAppSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID,
        userName: userName,
        callID: callUID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..layout = ZegoLayout.gallery()
          ..bottomMenuBarConfig = ZegoBottomMenuBarConfig(extendButtons: [
            const ShareButton(),
          ], buttons: [
            ZegoMenuBarButtonName.toggleCameraButton,
            ZegoMenuBarButtonName.toggleMicrophoneButton,
            ZegoMenuBarButtonName.hangUpButton,
            ZegoMenuBarButtonName.switchAudioOutputButton,
            ZegoMenuBarButtonName.switchCameraButton,
            ZegoMenuBarButtonName.showMemberListButton
          ])
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop());
  }
}
