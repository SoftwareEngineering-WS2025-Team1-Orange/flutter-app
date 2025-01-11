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
          requiredKeys: const ['access_token'],
        );
        final val = ResponseTokenDto(
          accessToken: $checkedConvert('access_token', (v) => v as String),
          tokenType: $checkedConvert('token_type', (v) => v as String?),
          expiresAt: $checkedConvert('expires_at', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'tokenType': 'token_type',
        'expiresAt': 'expires_at'
      },
    );

Map<String, dynamic> _$ResponseTokenDtoToJson(ResponseTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      if (instance.tokenType case final value?) 'token_type': value,
      if (instance.expiresAt case final value?) 'expires_at': value,
    };
