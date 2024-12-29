// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login200_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login200ResponseDto _$Login200ResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Login200ResponseDto',
      json,
      ($checkedConvert) {
        final val = Login200ResponseDto(
          donatorId: $checkedConvert('donator_id', (v) => (v as num?)?.toInt()),
          accessToken: $checkedConvert(
              'access_token',
              (v) => v == null
                  ? null
                  : ResponseTokenDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'donatorId': 'donator_id',
        'accessToken': 'access_token'
      },
    );

Map<String, dynamic> _$Login200ResponseDtoToJson(
        Login200ResponseDto instance) =>
    <String, dynamic>{
      if (instance.donatorId case final value?) 'donator_id': value,
      if (instance.accessToken?.toJson() case final value?)
        'access_token': value,
    };
