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
          requiredKeys: const [
            'id',
            'cuid',
            'name',
            'earningsLastUpdateSuccessfull'
          ],
        );
        final val = DonationboxDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          cuid: $checkedConvert('cuid', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String),
          lastSolarStatus:
              $checkedConvert('lastSolarStatus', (v) => v as String?),
          earningsLastSuccessfullUpdateAt: $checkedConvert(
              'earningsLastSuccessfullUpdateAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          earningsLastUpdateSuccessfull: $checkedConvert(
              'earningsLastUpdateSuccessfull', (v) => v as bool),
          powerSurplus: $checkedConvert('power_surplus', (v) => v as num?),
          powerConsumption:
              $checkedConvert('power_consumption', (v) => v as num?),
          powerSupplyId: $checkedConvert('powerSupplyId', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'powerSurplus': 'power_surplus',
        'powerConsumption': 'power_consumption'
      },
    );

Map<String, dynamic> _$DonationboxDtoToJson(DonationboxDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cuid': instance.cuid,
      'name': instance.name,
      if (instance.lastSolarStatus case final value?) 'lastSolarStatus': value,
      if (instance.earningsLastSuccessfullUpdateAt?.toIso8601String()
          case final value?)
        'earningsLastSuccessfullUpdateAt': value,
      'earningsLastUpdateSuccessfull': instance.earningsLastUpdateSuccessfull,
      if (instance.powerSurplus case final value?) 'power_surplus': value,
      if (instance.powerConsumption case final value?)
        'power_consumption': value,
      if (instance.powerSupplyId case final value?) 'powerSupplyId': value,
    };
