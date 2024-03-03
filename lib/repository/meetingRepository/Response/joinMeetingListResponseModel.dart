import 'package:video_call_app/repository/meetingRepository/Response/joinMeetingDataResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'joinMeetingListResponseModel.g.dart';

@JsonSerializable(anyMap: true)
class JoinMeetingListResponseModel {
  List<JoinMeetingDataResponseModel>? listMeetingData;
  bool? isError;
  String? errorMessage;

  JoinMeetingListResponseModel({
    this.listMeetingData,
    this.errorMessage,
    this.isError,
  });

  factory JoinMeetingListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$JoinMeetingListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinMeetingListResponseModelToJson(this);
}
