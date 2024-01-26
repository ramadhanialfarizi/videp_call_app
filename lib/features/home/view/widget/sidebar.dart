import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/core/utils/ImagesConstants.dart';
import 'package:video_call_app/core/utils/VColors.dart';
import 'package:video_call_app/features/onboarding/Login/view/loginScreen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthHelpers authHelpers = AuthHelpers();
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Container(),
                // USER EMAIL
                accountEmail: Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                  child: Text(
                    '${authHelpers.userLogin.currentUser?.email}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: VColors.redColors,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagesConstants.sidebarBg),
                    fit: BoxFit.cover,
                  ),
                  // color: Colors.amber,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.account_circle, color: Colors.white),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    VColors.redColors,
                  ),
                ),
                onPressed: () async {
                  await authHelpers.signOut();
                  Get.offAll(() => const LoginScreen());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
