import 'package:video_call_app/core/helpers/meetingsHelpers.dart';
import 'package:video_call_app/repository/meetingRepository/Request/createMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Request/joinMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/joinMeetingListResponseModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/meetingResponseModel.dart';
import 'package:video_call_app/repository/meetingRepository/VIewDataModel/joinMeetingDataDM.dart';
import 'package:video_call_app/repository/meetingRepository/VIewDataModel/joinMeetingListDM.dart';
import 'package:video_call_app/repository/meetingRepository/VIewDataModel/meetingDM.dart';

class MeetingRepository {
  Future<MeetingDM> createMeetingRoom(CreateMeetingRequestModel param) async {
    MeetingResponseModel responseData =
        await MeetingsHelpers().createMeetingRoomHelpers(param);

    MeetingDM createMeetingDataDM = MeetingDM();

    createMeetingDataDM.addMeetingRoom = responseData.addMeetingRoom;
    createMeetingDataDM.errorMessage = responseData.errorMessage;
    createMeetingDataDM.isError = responseData.isError;

    return createMeetingDataDM;
  }

  Future<JoinMeetingListDM> joinMeetingRoom(
      JoinMeetingRequestModel param) async {
    JoinMeetingListResponseModel responseModel =
        await MeetingsHelpers().getDataMeetingRoom(param);

    List<JoinMeetingDataDM> listMeetingData = [];

    JoinMeetingListDM joinMeetingListDM = JoinMeetingListDM();

    responseModel.listMeetingData?.forEach((element) {
      JoinMeetingDataDM data = JoinMeetingDataDM();
      data.docId = element.docId;
      data.idRoom = element.idRoom;

      listMeetingData.add(data);
    });

    joinMeetingListDM.listMeetingData = listMeetingData;
    joinMeetingListDM.isError = responseModel.isError;
    joinMeetingListDM.errorMessage = responseModel.errorMessage;

    return joinMeetingListDM;
  }
}
