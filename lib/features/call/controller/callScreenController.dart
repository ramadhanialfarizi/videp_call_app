import 'package:get/get.dart';
import 'package:video_call_app/core/helpers/helpers.dart';

class CallScreenController extends GetxController {
  shareMeetingRoom(String roomId) async {
    await Helpers().shareHelpers(
      subject: "Meetup App",
      text:
          "Hi there, welcome to Meetup.\n \nhere's your invitation room : \n$roomId",
    );
  }
}
