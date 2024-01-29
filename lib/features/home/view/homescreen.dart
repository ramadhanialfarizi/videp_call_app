import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/core/utils/VColors.dart';
import 'package:video_call_app/features/home/controller/homescreenController.dart';
import 'package:video_call_app/features/home/view/widget/sidebar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(HomescreenController());
    return Scaffold(
      drawer: Sidebar(
        onLogoutPressed: () {
          _controller.onLogout();
        },
      ),
      appBar: AppBar(
        title: Image.asset(
          ImagesConstants.productIcon,
          width: 100,
          height: 100,
        ),
        centerTitle: true,
      ),
      body: Obx(() => _controller.widgetOptions
          .elementAt(_controller.selectedWidget.value)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera_front),
              label: 'Meeting',
            ),
          ],
          currentIndex: _controller.selectedWidget.value,
          selectedItemColor: VColors.redColors,
          onTap: (index) {
            _controller.selectWidget(index);
          },
        ),
      ),
    );
  }
}
