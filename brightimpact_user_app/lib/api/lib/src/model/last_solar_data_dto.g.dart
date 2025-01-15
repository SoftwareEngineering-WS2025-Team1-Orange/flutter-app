// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_solar_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastSolarDataDto _$LastSolarDataDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LastSolarDataDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['production', 'consumption'],
        );
        final val = LastSolarDataDto(
          sysStatus: $checkedConvert('sysStatus', (v) => (v as num?)?.toInt()),
          stateOfCharge:
              $checkedConvert('stateOfCharge', (v) => (v as num?)?.toDouble()),
          production: $checkedConvert(
              'production',
              (v) => LastSolarDataProductionDto.fromJson(
                  v as Map<String, dynamic>)),
          consumption: $checkedConvert(
              'consumption',
              (v) => LastSolarDataConsumptionDto.fromJson(
                  v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LastSolarDataDtoToJson(LastSolarDataDto instance) =>
    <String, dynamic>{
      if (instance.sysStatus case final value?) 'sysStatus': value,
      if (instance.stateOfCharge case final value?) 'stateOfCharge': value,
      'production': instance.production.toJson(),
      'consumption': instance.consumption.toJson(),
    };
