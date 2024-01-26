import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/core/utils/VColors.dart';
import 'package:video_call_app/features/home/controller/homescreenController.dart';
import 'package:video_call_app/features/home/view/widget/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final TextEditingController callIdController = TextEditingController();
  // final TextEditingController userIdController = TextEditingController();
  // final TextEditingController userNameController = TextEditingController();
  // final formKey = GlobalKey<FormState>();

  final _controller = Get.put(HomescreenController());

  // void toCallScreen() {
  //   var isValidForm = formKey.currentState!.validate();

  //   if (isValidForm) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => CallScreen(
  //           callUID: callIdController.text,
  //           userID: userIdController.text,
  //           userName: userNameController.text,
  //         ),
  //       ),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('join fail'),
  //         duration: Duration(milliseconds: 800),
  //       ),
  //     );
  //   }
  // }

  @override
  void dispose() {
    // callIdController.dispose();
    // userIdController.dispose();
    // userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
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

  // Widget formCall() {
  //   return Form(
  //     key: formKey,
  //     child: Column(
  //       children: [
  //         TextFormField(
  //           controller: callIdController,
  //           decoration: const InputDecoration(
  //             hintText: 'input call id',
  //           ),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return '* please input call id';
  //             }

  //             return null;
  //           },
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         TextFormField(
  //           controller: userIdController,
  //           decoration: const InputDecoration(
  //             hintText: 'input user id',
  //           ),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return '* please input user id';
  //             }

  //             return null;
  //           },
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         TextFormField(
  //           controller: userNameController,
  //           decoration: const InputDecoration(
  //             hintText: 'input username',
  //           ),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return '* please input username';
  //             }

  //             return null;
  //           },
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         SizedBox(
  //           width: double.infinity,
  //           child: ElevatedButton(
  //             onPressed: toCallScreen,
  //             child: const Text(
  //               'Join call',
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget newHomescreen() {
  //   return SafeArea(
  //     child: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Container(),
  //       ),
  //     ),
  //   );
  // }
}
