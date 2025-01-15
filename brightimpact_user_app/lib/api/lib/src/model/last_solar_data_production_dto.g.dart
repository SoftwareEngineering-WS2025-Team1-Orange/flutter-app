// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_solar_data_production_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastSolarDataProductionDto _$LastSolarDataProductionDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'LastSolarDataProductionDto',
      json,
      ($checkedConvert) {
        final val = LastSolarDataProductionDto(
          solar: $checkedConvert('solar', (v) => (v as num?)?.toDouble()),
          add: $checkedConvert('add', (v) => (v as num?)?.toDouble()),
          grid: $checkedConvert('grid', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$LastSolarDataProductionDtoToJson(
        LastSolarDataProductionDto instance) =>
    <String, dynamic>{
      if (instance.solar case final value?) 'solar': value,
      if (instance.add case final value?) 'add': value,
      if (instance.grid case final value?) 'grid': value,
    };
