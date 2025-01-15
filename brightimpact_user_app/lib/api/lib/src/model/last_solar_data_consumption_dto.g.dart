// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_solar_data_consumption_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastSolarDataConsumptionDto _$LastSolarDataConsumptionDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LastSolarDataConsumptionDto',
      json,
      ($checkedConvert) {
        final val = LastSolarDataConsumptionDto(
          battery: $checkedConvert('battery', (v) => (v as num?)?.toDouble()),
          house: $checkedConvert('house', (v) => (v as num?)?.toDouble()),
          wallbox: $checkedConvert('wallbox', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LastSolarDataConsumptionDtoToJson(
        LastSolarDataConsumptionDto instance) =>
    <String, dynamic>{
      if (instance.battery case final value?) 'battery': value,
      if (instance.house case final value?) 'house': value,
      if (instance.wallbox case final value?) 'wallbox': value,
    };
