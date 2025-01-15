// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_to_ngo201_response_all_of_project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateToNgo201ResponseAllOfProjectDto
    _$DonateToNgo201ResponseAllOfProjectDtoFromJson(
            Map<String, dynamic> json) =>
        $checkedCreate(
          'DonateToNgo201ResponseAllOfProjectDto',
          json,
          ($checkedConvert) {
            $checkKeys(
              json,
              requiredKeys: const ['name', 'id'],
            );
            final val = DonateToNgo201ResponseAllOfProjectDto(
              name: $checkedConvert('name', (v) => v as String),
              id: $checkedConvert('id', (v) => (v as num).toInt()),
            );
            return val;
          },
        );

Map<String, dynamic> _$DonateToNgo201ResponseAllOfProjectDtoToJson(
        DonateToNgo201ResponseAllOfProjectDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };
