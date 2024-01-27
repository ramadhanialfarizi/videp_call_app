import 'package:flutter/material.dart';
import 'package:video_call_app/core/utils/VColors.dart';

class MeetingForm extends StatelessWidget {
  final VoidCallback onPressed;
  final Function(String value)? onTyping;
  final bool? showErrorMessage;
  final TextEditingController textEditingController;
  const MeetingForm({
    super.key,
    required this.onPressed,
    required this.textEditingController,
    this.showErrorMessage = false,
    this.onTyping,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Input Meeting Code',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: VColors.redColors,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: textEditingController,
            onChanged: onTyping ?? (value) {},
            decoration: InputDecoration(
              hintText: 'Input code',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: VColors.redColors,
                ),
              ),
            ),
          ),
          Visibility(
            visible: showErrorMessage ?? false,
            child: const Text(
              "Please input meeting code",
              style: TextStyle(
                color: VColors.redColors,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  VColors.redColors,
                ),
              ),
              child: const Text(
                "Join Meetings",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
