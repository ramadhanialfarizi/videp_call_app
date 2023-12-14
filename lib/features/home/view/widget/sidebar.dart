import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/features/onboarding/Login/view/loginScreen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthHelpers authHelpers = AuthHelpers();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Welcome...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // USER EMAIL
            accountEmail: Text(
              '${authHelpers.userLogin.currentUser?.email}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/sidebar_bg.jpg'),
              //   fit: BoxFit.cover,
              // ),
              color: Colors.amber,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFEA4CC0),
                ),
              ),
              onPressed: () async {
                await authHelpers.signOut();
                Get.offAll(() => const LoginScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
