// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDto _$ProjectDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ProjectDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'description',
            'is_favorite',
            'fundraising_goal',
            'fundraising_current',
            'target_date',
            'createdAt',
            'fundraising_closed',
            'progress',
            'category',
            'ngo'
          ],
        );
        final val = ProjectDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          bannerUri: $checkedConvert('banner_uri', (v) => v as String?),
          isFavorite: $checkedConvert('is_favorite', (v) => v as bool),
          fundraisingGoal: $checkedConvert('fundraising_goal', (v) => v as num),
          fundraisingCurrent:
              $checkedConvert('fundraising_current', (v) => v as num),
          targetDate: $checkedConvert(
              'target_date', (v) => DateTime.parse(v as String)),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          fundraisingClosed:
              $checkedConvert('fundraising_closed', (v) => v as bool),
          progress: $checkedConvert('progress', (v) => v as num),
          category: $checkedConvert(
              'category', (v) => $enumDecode(_$ProjectCategoryDtoEnumMap, v)),
          ngo: $checkedConvert(
              'ngo', (v) => NGOBasicDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'bannerUri': 'banner_uri',
        'isFavorite': 'is_favorite',
        'fundraisingGoal': 'fundraising_goal',
        'fundraisingCurrent': 'fundraising_current',
        'targetDate': 'target_date',
        'fundraisingClosed': 'fundraising_closed'
      },
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      if (instance.bannerUri case final value?) 'banner_uri': value,
      'is_favorite': instance.isFavorite,
      'fundraising_goal': instance.fundraisingGoal,
      'fundraising_current': instance.fundraisingCurrent,
      'target_date': instance.targetDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'fundraising_closed': instance.fundraisingClosed,
      'progress': instance.progress,
      'category': _$ProjectCategoryDtoEnumMap[instance.category]!,
      'ngo': instance.ngo.toJson(),
    };

const _$ProjectCategoryDtoEnumMap = {
  ProjectCategoryDto.education: 'Education',
  ProjectCategoryDto.health: 'Health',
  ProjectCategoryDto.environment: 'Environment',
  ProjectCategoryDto.humanRights: 'Human_Rights',
  ProjectCategoryDto.animalRights: 'Animal_Rights',
  ProjectCategoryDto.social: 'Social',
  ProjectCategoryDto.other: 'Other',
};
