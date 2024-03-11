import 'package:share_plus/share_plus.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';

class Helpers {
  Future shareHelpers({String? text, String? subject}) async {
    try {
      final result = await Share.share(text ?? "", subject: subject);

      return result;
    } catch (e) {
      return e.toString();
    }
  }

  // STILL ERROR IT WILL BE FIXING SOON
  Future shareWithImages({String? text, String? subject}) async {
    try {
      final result = await Share.shareXFiles(
          [XFile('assets/icons/meet_up_icon.png')],
          text: text ?? "", subject: subject);

      return result;
    } catch (e) {
      LogUtility.writeLog(e.toString());
    }
  }
}
