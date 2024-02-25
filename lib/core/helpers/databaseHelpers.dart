import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';
import 'package:video_call_app/repository/meetingRepository/Request/meetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/meetingResponseModel.dart';

class DatabaseHelpers {
  final curentUser = FirebaseAuth.instance;
  CollectionReference? collectionReference;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<MeetingResponseModel> createMeetingRoomHelpers(
      MeetingRequestModel param) async {
    collectionReference =
        firebaseFirestore.collection('meeting-room-collection');

    MeetingResponseModel meetingResponseModel = MeetingResponseModel();

    try {
      var addMeetingRoom = await collectionReference?.add({
        'idRoom': param.idRoom,
      });

      meetingResponseModel.addMeetingRoom = addMeetingRoom;
      meetingResponseModel.isError = false;
      meetingResponseModel.errorMessage = "";

      return meetingResponseModel;
    } catch (e) {
      LogUtility.writeLog(e.toString());

      meetingResponseModel.errorMessage = e.toString();
      meetingResponseModel.isError = true;
      return meetingResponseModel;
    }
  }

  createMeetingRoom(MeetingRequestModel param) {}
}
