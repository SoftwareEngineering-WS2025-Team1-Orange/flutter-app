// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donationbox_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationboxRegisterDto _$DonationboxRegisterDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationboxRegisterDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['cuid', 'name'],
        );
        final val = DonationboxRegisterDto(
          cuid: $checkedConvert('cuid', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          powerSupplyId:
              $checkedConvert('power_supply_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'powerSupplyId': 'power_supply_id'},
    );

Map<String, dynamic> _$DonationboxRegisterDtoToJson(
        DonationboxRegisterDto instance) =>
    <String, dynamic>{
      'cuid': instance.cuid,
      'name': instance.name,
      if (instance.powerSupplyId case final value?) 'power_supply_id': value,
    };
