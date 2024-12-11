// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donator_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatorRegisterDto _$DonatorRegisterDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonatorRegisterDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'password', 'mail'],
        );
        final val = DonatorRegisterDto(
          name: $checkedConvert('name', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          mail: $checkedConvert('mail', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorRegisterDtoToJson(DonatorRegisterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'mail': instance.mail,
    };
