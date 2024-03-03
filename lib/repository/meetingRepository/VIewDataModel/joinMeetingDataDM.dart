import 'package:json_annotation/json_annotation.dart';

part 'joinMeetingDataDM.g.dart';

@JsonSerializable(anyMap: true)
class JoinMeetingDataDM {
  String? docId;
  String? idRoom;

  JoinMeetingDataDM({this.docId, this.idRoom});

  factory JoinMeetingDataDM.fromJson(Map<String, dynamic> json) =>
      _$JoinMeetingDataDMFromJson(json);

  Map<String, dynamic> toJson() => _$JoinMeetingDataDMToJson(this);
}
