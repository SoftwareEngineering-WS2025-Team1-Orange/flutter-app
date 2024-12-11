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
          requiredKeys: const ['id'],
        );
        final val = DonationboxRegisterDto(
          id: $checkedConvert('id', (v) => v as String),
          locLat: $checkedConvert('loc_lat', (v) => v as num?),
          locLgt: $checkedConvert('loc_lgt', (v) => v as num?),
          powerSupplyId:
              $checkedConvert('power_supply_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'locLat': 'loc_lat',
        'locLgt': 'loc_lgt',
        'powerSupplyId': 'power_supply_id'
      },
    );

Map<String, dynamic> _$DonationboxRegisterDtoToJson(
        DonationboxRegisterDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.locLat case final value?) 'loc_lat': value,
      if (instance.locLgt case final value?) 'loc_lgt': value,
      if (instance.powerSupplyId case final value?) 'power_supply_id': value,
    };
