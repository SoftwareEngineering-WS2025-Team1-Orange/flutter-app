// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donator_update_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatorUpdateDto _$DonatorUpdateDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonatorUpdateDto',
      json,
      ($checkedConvert) {
        final val = DonatorUpdateDto(
          firstName: $checkedConvert('firstName', (v) => v as String?),
          lastName: $checkedConvert('lastName', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorUpdateDtoToJson(DonatorUpdateDto instance) =>
    <String, dynamic>{
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.email case final value?) 'email': value,
      if (instance.password case final value?) 'password': value,
    };
