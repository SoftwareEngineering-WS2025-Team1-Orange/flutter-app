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
          requiredKeys: const ['password'],
        );
        final val = DonatorRegisterDto(
          firstName: $checkedConvert('firstName', (v) => v as String?),
          lastName: $checkedConvert('lastName', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorRegisterDtoToJson(DonatorRegisterDto instance) =>
    <String, dynamic>{
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      'password': instance.password,
      if (instance.email case final value?) 'email': value,
    };
