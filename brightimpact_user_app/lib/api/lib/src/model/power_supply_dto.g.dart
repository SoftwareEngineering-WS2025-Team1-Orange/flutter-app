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
            'supply_type',
            'is_online',
            'power_surplus',
            'name',
            'model_number'
          ],
        );
        final val = PowerSupplyDto(
          id: $checkedConvert('id', (v) => v as String),
          supplyType: $checkedConvert('supply_type',
              (v) => $enumDecode(_$PowerSupplyDtoSupplyTypeEnumEnumMap, v)),
          isOnline: $checkedConvert('is_online', (v) => v as bool),
          powerSurplus: $checkedConvert('power_surplus', (v) => v as num),
          name: $checkedConvert('name', (v) => v as String),
          modelNumber: $checkedConvert('model_number', (v) => v as String),
          apiKey: $checkedConvert('api_key', (v) => v as String?),
          ip: $checkedConvert('ip', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'supplyType': 'supply_type',
        'isOnline': 'is_online',
        'powerSurplus': 'power_surplus',
        'modelNumber': 'model_number',
        'apiKey': 'api_key'
      },
    );

Map<String, dynamic> _$PowerSupplyDtoToJson(PowerSupplyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supply_type':
          _$PowerSupplyDtoSupplyTypeEnumEnumMap[instance.supplyType]!,
      'is_online': instance.isOnline,
      'power_surplus': instance.powerSurplus,
      'name': instance.name,
      'model_number': instance.modelNumber,
      if (instance.apiKey case final value?) 'api_key': value,
      if (instance.ip case final value?) 'ip': value,
      if (instance.password case final value?) 'password': value,
    };

const _$PowerSupplyDtoSupplyTypeEnumEnumMap = {
  PowerSupplyDtoSupplyTypeEnum.solar: 'Solar',
  PowerSupplyDtoSupplyTypeEnum.alternative: 'Alternative',
};
