import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/home/view/widget/homeWidget.dart';
import 'package:video_call_app/features/home/view/widget/meetWidget.dart';
import 'package:video_call_app/features/onboarding/Login/view/loginScreen.dart';

class HomescreenController extends GetxController {
  RxInt selectedWidget = 0.obs;

  final AuthHelpers authHelpers = AuthHelpers();

  List<Widget> widgetOptions = <Widget>[
    const HomeWidget(),
    const MeetWidget(),
  ];

  selectWidget(int index) {
    selectedWidget.value = index;
  }

  onLogout() async {
    await authHelpers.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
