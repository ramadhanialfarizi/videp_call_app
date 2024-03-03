import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingDM {
  DocumentReference<Object?>? addMeetingRoom;
  bool? isError;
  String? errorMessage;

  MeetingDM({
    this.addMeetingRoom,
    this.isError,
    this.errorMessage,
  });
}
