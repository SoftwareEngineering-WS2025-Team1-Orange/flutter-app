// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donationbox_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationboxDto _$DonationboxDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationboxDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'state', 'power_consumption'],
        );
        final val = DonationboxDto(
          id: $checkedConvert('id', (v) => v as String),
          state: $checkedConvert(
              'state', (v) => $enumDecode(_$DonationboxDtoStateEnumEnumMap, v)),
          powerConsumption:
              $checkedConvert('power_consumption', (v) => v as num),
          locLat: $checkedConvert('loc_lat', (v) => v as num?),
          locLgt: $checkedConvert('loc_lgt', (v) => v as num?),
          powerSupplyId:
              $checkedConvert('power_supply_id', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'powerConsumption': 'power_consumption',
        'locLat': 'loc_lat',
        'locLgt': 'loc_lgt',
        'powerSupplyId': 'power_supply_id'
      },
    );

Map<String, dynamic> _$DonationboxDtoToJson(DonationboxDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': _$DonationboxDtoStateEnumEnumMap[instance.state]!,
      'power_consumption': instance.powerConsumption,
      if (instance.locLat case final value?) 'loc_lat': value,
      if (instance.locLgt case final value?) 'loc_lgt': value,
      if (instance.powerSupplyId case final value?) 'power_supply_id': value,
    };

const _$DonationboxDtoStateEnumEnumMap = {
  DonationboxDtoStateEnum.OFFLINE: 'OFFLINE',
  DonationboxDtoStateEnum.CONNECTED: 'CONNECTED',
  DonationboxDtoStateEnum.READY: 'READY',
  DonationboxDtoStateEnum.RUNNING: 'RUNNING',
  DonationboxDtoStateEnum.ERROR: 'ERROR',
};
