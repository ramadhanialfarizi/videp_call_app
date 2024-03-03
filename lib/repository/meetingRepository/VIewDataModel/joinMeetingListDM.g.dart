// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joinMeetingListDM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinMeetingListDM _$JoinMeetingListDMFromJson(Map json) => JoinMeetingListDM(
      listMeetingData: (json['listMeetingData'] as List<dynamic>?)
          ?.map((e) =>
              JoinMeetingDataDM.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
      isError: json['isError'] as bool?,
    );

Map<String, dynamic> _$JoinMeetingListDMToJson(JoinMeetingListDM instance) =>
    <String, dynamic>{
      'listMeetingData': instance.listMeetingData,
      'isError': instance.isError,
      'errorMessage': instance.errorMessage,
    };
