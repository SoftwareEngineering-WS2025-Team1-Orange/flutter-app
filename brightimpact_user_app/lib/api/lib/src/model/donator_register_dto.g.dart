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
          requiredKeys: const ['firstname', 'lastname', 'password', 'mail'],
        );
        final val = DonatorRegisterDto(
          firstname: $checkedConvert('firstname', (v) => v as String),
          lastname: $checkedConvert('lastname', (v) => v as String),
          password: $checkedConvert('password', (v) => v as String),
          mail: $checkedConvert('mail', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorRegisterDtoToJson(DonatorRegisterDto instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'mail': instance.mail,
    };
