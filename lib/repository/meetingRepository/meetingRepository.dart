import 'package:video_call_app/core/helpers/databaseHelpers.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';
import 'package:video_call_app/repository/meetingRepository/Request/meetingRequestModel.dart';

class MeetingRepository {
  Future createMeetingRoom(MeetingRequestModel? param) async {
    if (param != null) {
      try {
        var createMeetingData =
            await DatabaseHelpers().createMeetingRoomHelpers(param);

        return createMeetingData;
      } catch (e) {
        LogUtility.writeLog(e);
        return null;
      }
    }
  }
}
