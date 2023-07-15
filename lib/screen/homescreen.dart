import 'package:flutter/material.dart';
import 'package:video_call_app/screen/callScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController callIdController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void toCallScreen() {
    var isValidForm = formKey.currentState!.validate();

    if (isValidForm) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CallScreen(
            callUID: callIdController.text,
            userID: userIdController.text,
            userName: userNameController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('join fail'),
          duration: Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    callIdController.dispose();
    userIdController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: callIdController,
                    decoration: const InputDecoration(
                      hintText: 'input call id',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* please input call id';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userIdController,
                    decoration: const InputDecoration(
                      hintText: 'input user id',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* please input user id';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      hintText: 'input username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '* please input username';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: toCallScreen,
                      child: const Text(
                        'Join call',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
