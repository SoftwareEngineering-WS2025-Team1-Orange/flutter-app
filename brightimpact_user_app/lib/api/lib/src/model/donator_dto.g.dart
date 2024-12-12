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
          requiredKeys: const ['name', 'mail', 'donator_id'],
        );
        final val = DonatorDto(
          name: $checkedConvert('name', (v) => v as String),
          mail: $checkedConvert('mail', (v) => v as String),
          donatorId: $checkedConvert('donator_id', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'donatorId': 'donator_id'},
    );

Map<String, dynamic> _$DonatorDtoToJson(DonatorDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mail': instance.mail,
      'donator_id': instance.donatorId,
    };
