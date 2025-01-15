// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectBasicDto _$ProjectBasicDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ProjectBasicDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['name', 'id'],
        );
        final val = ProjectBasicDto(
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ProjectBasicDtoToJson(ProjectBasicDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
