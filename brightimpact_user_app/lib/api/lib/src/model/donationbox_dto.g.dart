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
          requiredKeys: const ['id', 'cuid', 'last_status'],
        );
        final val = DonationboxDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          cuid: $checkedConvert('cuid', (v) => v as String),
          lastStatus: $checkedConvert('last_status',
              (v) => $enumDecode(_$DonationboxDtoLastStatusEnumEnumMap, v)),
          powerConsumption:
              $checkedConvert('power_consumption', (v) => v as num?),
          powerSupplyId: $checkedConvert('powerSupplyId', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastStatus': 'last_status',
        'powerConsumption': 'power_consumption'
      },
    );

Map<String, dynamic> _$DonationboxDtoToJson(DonationboxDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cuid': instance.cuid,
      'last_status':
          _$DonationboxDtoLastStatusEnumEnumMap[instance.lastStatus]!,
      if (instance.powerConsumption case final value?)
        'power_consumption': value,
      if (instance.powerSupplyId case final value?) 'powerSupplyId': value,
    };

const _$DonationboxDtoLastStatusEnumEnumMap = {
  DonationboxDtoLastStatusEnum.OFFLINE: 'OFFLINE',
  DonationboxDtoLastStatusEnum.ERROR: 'ERROR',
  DonationboxDtoLastStatusEnum.CONNECTED: 'CONNECTED',
  DonationboxDtoLastStatusEnum.READY: 'READY',
  DonationboxDtoLastStatusEnum.WORKING: 'WORKING',
};
