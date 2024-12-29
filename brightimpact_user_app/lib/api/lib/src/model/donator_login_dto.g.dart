// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donator_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatorLoginDto _$DonatorLoginDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonatorLoginDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['mail', 'password'],
        );
        final val = DonatorLoginDto(
          mail: $checkedConvert('mail', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorLoginDtoToJson(DonatorLoginDto instance) =>
    <String, dynamic>{
      'mail': instance.mail,
      'password': instance.password,
    };
