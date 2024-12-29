// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PaginationDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'totalResults',
            'filteredResults',
            'currentPage',
            'pageSize',
            'numberOfPages'
          ],
        );
        final val = PaginationDto(
          totalResults:
              $checkedConvert('totalResults', (v) => (v as num).toInt()),
          filteredResults:
              $checkedConvert('filteredResults', (v) => (v as num).toInt()),
          currentPage:
              $checkedConvert('currentPage', (v) => (v as num).toInt()),
          pageSize: $checkedConvert('pageSize', (v) => (v as num).toInt()),
          numberOfPages:
              $checkedConvert('numberOfPages', (v) => (v as num).toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaginationDtoToJson(PaginationDto instance) =>
    <String, dynamic>{
      'totalResults': instance.totalResults,
      'filteredResults': instance.filteredResults,
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'numberOfPages': instance.numberOfPages,
    };
