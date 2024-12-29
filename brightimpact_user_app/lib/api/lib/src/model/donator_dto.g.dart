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
            'firstname',
            'lastname',
            'mail',
            'balance',
            'id'
          ],
        );
        final val = DonatorDto(
          firstname: $checkedConvert('firstname', (v) => v as String),
          lastname: $checkedConvert('lastname', (v) => v as String),
          mail: $checkedConvert('mail', (v) => v as String),
          balance: $checkedConvert('balance', (v) => v as num),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonatorDtoToJson(DonatorDto instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'mail': instance.mail,
      'balance': instance.balance,
      'id': instance.id,
    };
