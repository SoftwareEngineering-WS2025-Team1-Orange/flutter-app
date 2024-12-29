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
          requiredKeys: const ['name', 'model_number', 'api_config', 'type'],
        );
        final val = PowerSupplyRegisterDto(
          name: $checkedConvert('name', (v) => v as String),
          modelNumber: $checkedConvert('model_number', (v) => v as String),
          apiConfig: $checkedConvert('api_config', (v) => v as String),
          type: $checkedConvert('type',
              (v) => $enumDecode(_$PowerSupplyRegisterDtoTypeEnumEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'modelNumber': 'model_number',
        'apiConfig': 'api_config'
      },
    );

Map<String, dynamic> _$PowerSupplyRegisterDtoToJson(
        PowerSupplyRegisterDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'model_number': instance.modelNumber,
      'api_config': instance.apiConfig,
      'type': _$PowerSupplyRegisterDtoTypeEnumEnumMap[instance.type]!,
    };

const _$PowerSupplyRegisterDtoTypeEnumEnumMap = {
  PowerSupplyRegisterDtoTypeEnum.solar: 'Solar',
  PowerSupplyRegisterDtoTypeEnum.alternative: 'Alternative',
};
