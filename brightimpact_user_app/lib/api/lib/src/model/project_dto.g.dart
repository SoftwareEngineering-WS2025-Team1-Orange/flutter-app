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
            'fundraising_goal',
            'fundraising_current',
            'target_date',
            'fundraising_closed',
            'progress'
          ],
        );
        final val = ProjectDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          bannerUri: $checkedConvert('banner_uri', (v) => v as String?),
          ngoId: $checkedConvert('ngo_id', (v) => (v as num?)?.toInt()),
          ngoName: $checkedConvert('ngo_name', (v) => v as String?),
          isFavorite: $checkedConvert('is_favorite', (v) => v as bool?),
          fundraisingGoal: $checkedConvert('fundraising_goal', (v) => v as num),
          fundraisingCurrent:
              $checkedConvert('fundraising_current', (v) => v as num),
          targetDate: $checkedConvert(
              'target_date', (v) => DateTime.parse(v as String)),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          fundraisingClosed:
              $checkedConvert('fundraising_closed', (v) => v as bool),
          progress: $checkedConvert('progress', (v) => v as num),
          isArchived: $checkedConvert('is_archived', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {
        'bannerUri': 'banner_uri',
        'ngoId': 'ngo_id',
        'ngoName': 'ngo_name',
        'isFavorite': 'is_favorite',
        'fundraisingGoal': 'fundraising_goal',
        'fundraisingCurrent': 'fundraising_current',
        'targetDate': 'target_date',
        'createdAt': 'created_at',
        'fundraisingClosed': 'fundraising_closed',
        'isArchived': 'is_archived'
      },
    );

Map<String, dynamic> _$ProjectDtoToJson(ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      if (instance.bannerUri case final value?) 'banner_uri': value,
      if (instance.ngoId case final value?) 'ngo_id': value,
      if (instance.ngoName case final value?) 'ngo_name': value,
      if (instance.isFavorite case final value?) 'is_favorite': value,
      'fundraising_goal': instance.fundraisingGoal,
      'fundraising_current': instance.fundraisingCurrent,
      'target_date': instance.targetDate.toIso8601String(),
      if (instance.createdAt?.toIso8601String() case final value?)
        'created_at': value,
      'fundraising_closed': instance.fundraisingClosed,
      'progress': instance.progress,
      if (instance.isArchived case final value?) 'is_archived': value,
    };
