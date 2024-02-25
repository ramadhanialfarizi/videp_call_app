import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingResponseModel {
  DocumentReference<Object?>? addMeetingRoom;
  bool? isError;
  String? errorMessage;

  MeetingResponseModel({
    this.addMeetingRoom,
    this.isError,
    this.errorMessage,
  });
}
