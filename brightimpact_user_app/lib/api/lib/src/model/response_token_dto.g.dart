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
          expiresIn: $checkedConvert('expires_in', (v) => (v as num?)?.toInt()),
          scope: $checkedConvert('scope', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'tokenType': 'token_type',
        'expiresIn': 'expires_in'
      },
    );

Map<String, dynamic> _$ResponseTokenDtoToJson(ResponseTokenDto instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      if (instance.tokenType case final value?) 'token_type': value,
      if (instance.expiresIn case final value?) 'expires_in': value,
      if (instance.scope case final value?) 'scope': value,
    };
