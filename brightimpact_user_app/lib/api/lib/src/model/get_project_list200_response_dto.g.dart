// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_project_list200_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProjectList200ResponseDto _$GetProjectList200ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetProjectList200ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['projects', 'pagination'],
        );
        final val = GetProjectList200ResponseDto(
          projects: $checkedConvert(
              'projects',
              (v) => (v as List<dynamic>)
                  .map((e) => ProjectDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pagination: $checkedConvert('pagination',
              (v) => PaginationDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$GetProjectList200ResponseDtoToJson(
        GetProjectList200ResponseDto instance) =>
    <String, dynamic>{
      'projects': instance.projects.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };
