import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';
import 'package:video_call_app/repository/meetingRepository/Request/meetingRequestModel.dart';

class DatabaseHelpers {
  final curentUser = FirebaseAuth.instance;
  CollectionReference? collectionReference;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future createMeetingRoomHelpers(MeetingRequestModel param) async {
    collectionReference =
        firebaseFirestore.collection('meeting-room-collection');

    try {
      var addMeetingRoom = await collectionReference?.add({
        'idRoom': param.idRoom,
      });

      return addMeetingRoom;
    } catch (e) {
      LogUtility.writeLog(e.toString());
      return e;
    }
  }
}
