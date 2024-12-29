// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_supply_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PowerSupplyDto _$PowerSupplyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PowerSupplyDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'type',
            'last_status',
            'power_surplus',
            'name',
            'model_number',
            'api_config'
          ],
        );
        final val = PowerSupplyDto(
          id: $checkedConvert('id', (v) => v as String),
          type: $checkedConvert(
              'type', (v) => $enumDecode(_$PowerSupplyDtoTypeEnumEnumMap, v)),
          lastStatus: $checkedConvert('last_status',
              (v) => $enumDecode(_$PowerSupplyDtoLastStatusEnumEnumMap, v)),
          powerSurplus: $checkedConvert('power_surplus', (v) => v as num),
          name: $checkedConvert('name', (v) => v as String),
          modelNumber: $checkedConvert('model_number', (v) => v as String),
          apiConfig: $checkedConvert('api_config', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'lastStatus': 'last_status',
        'powerSurplus': 'power_surplus',
        'modelNumber': 'model_number',
        'apiConfig': 'api_config'
      },
    );

Map<String, dynamic> _$PowerSupplyDtoToJson(PowerSupplyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PowerSupplyDtoTypeEnumEnumMap[instance.type]!,
      'last_status':
          _$PowerSupplyDtoLastStatusEnumEnumMap[instance.lastStatus]!,
      'power_surplus': instance.powerSurplus,
      'name': instance.name,
      'model_number': instance.modelNumber,
      'api_config': instance.apiConfig,
    };

const _$PowerSupplyDtoTypeEnumEnumMap = {
  PowerSupplyDtoTypeEnum.solar: 'Solar',
  PowerSupplyDtoTypeEnum.alternative: 'Alternative',
};

const _$PowerSupplyDtoLastStatusEnumEnumMap = {
  PowerSupplyDtoLastStatusEnum.OFFLINE: 'OFFLINE',
  PowerSupplyDtoLastStatusEnum.CONNECTED: 'CONNECTED',
  PowerSupplyDtoLastStatusEnum.INVALID_AUTH: 'INVALID_AUTH',
  PowerSupplyDtoLastStatusEnum.ERROR: 'ERROR',
};
