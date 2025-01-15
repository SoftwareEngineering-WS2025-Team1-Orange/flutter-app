// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigDto _$ConfigDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ConfigDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['e3dc_user', 'e3dc_password', 'e3dc_serial'],
        );
        final val = ConfigDto(
          e3dcUser: $checkedConvert('e3dc_user', (v) => v as String),
          e3dcPassword: $checkedConvert('e3dc_password', (v) => v as String),
          e3dcSerial: $checkedConvert('e3dc_serial', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'e3dcUser': 'e3dc_user',
        'e3dcPassword': 'e3dc_password',
        'e3dcSerial': 'e3dc_serial'
      },
    );

Map<String, dynamic> _$ConfigDtoToJson(ConfigDto instance) => <String, dynamic>{
      'e3dc_user': instance.e3dcUser,
      'e3dc_password': instance.e3dcPassword,
      'e3dc_serial': instance.e3dcSerial,
    };
