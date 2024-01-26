import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_call_app/features/home/view/widget/homeWidget.dart';
import 'package:video_call_app/features/home/view/widget/meetWidget.dart';

class HomescreenController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetOptions = <Widget>[
    const HomeWidget(),
    const MeetWidget(),
  ];

  selectWidget(int index) {
    selectedWidget.value = index;
  }
}
