import 'package:video_call_app/core/helpers/databaseHelpers.dart';
import 'package:video_call_app/repository/meetingRepository/Request/meetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/meetingResponseModel.dart';

class MeetingRepository {
  Future<MeetingResponseModel> createMeetingRoom(
      MeetingRequestModel? param) async {
    if (param != null) {
      MeetingResponseModel createMeetingData =
          await DatabaseHelpers().createMeetingRoomHelpers(param);

      return createMeetingData;
    } else {
      return MeetingResponseModel();
    }
  }
}
