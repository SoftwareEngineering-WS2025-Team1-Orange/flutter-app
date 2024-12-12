// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseTokenDto _$ResponseTokenDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResponseTokenDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['access_token', 'token_type'],
        );
        final val = ResponseTokenDto(
          accessToken: $checkedConvert('access_token', (v) => v as String),
          tokenType: $checkedConvert('token_type', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'tokenType': 'token_type'
      },
    );

Map<String, dynamic> _$ResponseTokenDtoToJson(ResponseTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };
