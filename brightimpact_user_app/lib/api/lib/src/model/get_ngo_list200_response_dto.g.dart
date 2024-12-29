// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ngo_list200_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNgoList200ResponseDto _$GetNgoList200ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetNgoList200ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['ngos', 'pagination'],
        );
        final val = GetNgoList200ResponseDto(
          ngos: $checkedConvert(
              'ngos',
              (v) => (v as List<dynamic>)
                  .map((e) => NGODto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pagination: $checkedConvert('pagination',
              (v) => PaginationDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$GetNgoList200ResponseDtoToJson(
        GetNgoList200ResponseDto instance) =>
    <String, dynamic>{
      'ngos': instance.ngos.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };
