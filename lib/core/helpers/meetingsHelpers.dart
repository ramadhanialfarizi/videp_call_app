import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';
import 'package:video_call_app/repository/meetingRepository/Request/createMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Request/joinMeetingRequestModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/joinMeetingDataResponse.dart';
import 'package:video_call_app/repository/meetingRepository/Response/joinMeetingListResponseModel.dart';
import 'package:video_call_app/repository/meetingRepository/Response/meetingResponseModel.dart';

class MeetingsHelpers {
  final curentUser = FirebaseAuth.instance;
  CollectionReference? collectionReference;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<MeetingResponseModel> createMeetingRoomHelpers(
      CreateMeetingRequestModel param) async {
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

  Future<JoinMeetingListResponseModel> getDataMeetingRoom(
      JoinMeetingRequestModel param) async {
    JoinMeetingListResponseModel meetingListResponseModel =
        JoinMeetingListResponseModel();
    List<JoinMeetingDataResponseModel> dataList = [];
    try {
      await FirebaseFirestore.instance
          .collection('meeting-room-collection')
          .where('idRoom', isEqualTo: param.meetingRoomId)
          .get()
          .catchError(
        (onError) {
          meetingListResponseModel.isError = true;
          meetingListResponseModel.errorMessage = "$onError";
          meetingListResponseModel.listMeetingData = [];

          return onError;
        },
      ).then((value) {
        for (var element in value.docs) {
          Map<String, dynamic> json = {
            'docId': element.id,
            'idRoom': element['idRoom'],
          };

          JoinMeetingDataResponseModel data =
              JoinMeetingDataResponseModel.fromJson(json);
          dataList.add(data);

          LogUtility.writeLog("data model meeting : ${jsonEncode(dataList)}");
        }

        meetingListResponseModel.listMeetingData = dataList;
        meetingListResponseModel.isError = false;
        meetingListResponseModel.errorMessage = "";

        return value;
      });

      LogUtility.writeLog(
          "data list meeting : ${jsonEncode(meetingListResponseModel)}");

      return meetingListResponseModel;
    } catch (e) {
      LogUtility.writeLog(e.toString());
      meetingListResponseModel.isError = true;
      meetingListResponseModel.errorMessage = "$e";
      meetingListResponseModel.listMeetingData = [];

      return meetingListResponseModel;
    }
  }
}
