// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTokenDto _$RequestTokenDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RequestTokenDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['grant_type', 'client_id', 'client_secret'],
        );
        final val = RequestTokenDto(
          grantType: $checkedConvert('grant_type', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
          scope: $checkedConvert('scope', (v) => v as String? ?? ''),
          clientId: $checkedConvert('client_id', (v) => v as String?),
          clientSecret: $checkedConvert('client_secret', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'grantType': 'grant_type',
        'clientId': 'client_id',
        'clientSecret': 'client_secret'
      },
    );

Map<String, dynamic> _$RequestTokenDtoToJson(RequestTokenDto instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      if (instance.username case final value?) 'username': value,
      if (instance.password case final value?) 'password': value,
      if (instance.scope case final value?) 'scope': value,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
