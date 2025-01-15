// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donator_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonatorDto _$DonatorDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DonatorDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'firstName',
            'lastName',
            'email',
            'balance',
            'id'
          ],
        );
        final val = DonatorDto(
          firstName: $checkedConvert('firstName', (v) => v as String),
          lastName: $checkedConvert('lastName', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          balance: $checkedConvert('balance', (v) => v as num),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorDtoToJson(DonatorDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'balance': instance.balance,
      'id': instance.id,
    };
