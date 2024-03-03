import 'package:json_annotation/json_annotation.dart';

part 'joinMeetingDataResponse.g.dart';

@JsonSerializable(anyMap: true)
class JoinMeetingDataResponseModel {
  String? docId;
  String? idRoom;

  JoinMeetingDataResponseModel({this.docId, this.idRoom});

  factory JoinMeetingDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JoinMeetingDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinMeetingDataResponseModelToJson(this);
}
