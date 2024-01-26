import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_call_app/features/home/view/widget/homeWidget.dart';

class HomescreenController extends GetxController {
  RxInt selectedWidget = 0.obs;

  List<Widget> widgetOptions = <Widget>[
    const HomeWidget(),
  ];

  selectWidget(int index) {
    selectedWidget.value = index;
  }
}
