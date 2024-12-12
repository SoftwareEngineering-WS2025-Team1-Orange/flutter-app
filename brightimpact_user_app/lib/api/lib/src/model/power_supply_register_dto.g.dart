// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_supply_register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerSupplyRegisterDto _$PowerSupplyRegisterDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PowerSupplyRegisterDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'model_number'],
        );
        final val = PowerSupplyRegisterDto(
          name: $checkedConvert('name', (v) => v as String),
          modelNumber: $checkedConvert('model_number', (v) => v as String),
          apiKey: $checkedConvert('api_key', (v) => v as String?),
          ip: $checkedConvert('ip', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'modelNumber': 'model_number', 'apiKey': 'api_key'},
    );

Map<String, dynamic> _$PowerSupplyRegisterDtoToJson(
        PowerSupplyRegisterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model_number': instance.modelNumber,
      if (instance.apiKey case final value?) 'api_key': value,
      if (instance.ip case final value?) 'ip': value,
      if (instance.password case final value?) 'password': value,
    };
