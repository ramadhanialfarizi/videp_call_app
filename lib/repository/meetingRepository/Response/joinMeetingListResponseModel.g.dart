// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinMeetingListResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinMeetingListResponseModel _$JoinMeetingListResponseModelFromJson(Map json) =>
    JoinMeetingListResponseModel(
      listMeetingData: (json['listMeetingData'] as List<dynamic>?)
          ?.map((e) => JoinMeetingDataResponseModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
      isError: json['isError'] as bool?,
    );

Map<String, dynamic> _$JoinMeetingListResponseModelToJson(
        JoinMeetingListResponseModel instance) =>
    <String, dynamic>{
      'listMeetingData': instance.listMeetingData,
      'isError': instance.isError,
      'errorMessage': instance.errorMessage,
    };
