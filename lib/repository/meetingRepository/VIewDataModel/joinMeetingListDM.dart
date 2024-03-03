import 'package:video_call_app/repository/meetingRepository/VIewDataModel/joinMeetingDataDM.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joinMeetingListDM.g.dart';

@JsonSerializable(anyMap: true)
class JoinMeetingListDM {
  List<JoinMeetingDataDM>? listMeetingData;
  bool? isError;
  String? errorMessage;

  JoinMeetingListDM({
    this.listMeetingData,
    this.errorMessage,
    this.isError,
  });

  factory JoinMeetingListDM.fromJson(Map<String, dynamic> json) =>
      _$JoinMeetingListDMFromJson(json);

  Map<String, dynamic> toJson() => _$JoinMeetingListDMToJson(this);
}
