// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngo_basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NGOBasicDto _$NGOBasicDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NGOBasicDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'id'],
        );
        final val = NGOBasicDto(
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$NGOBasicDtoToJson(NGOBasicDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
