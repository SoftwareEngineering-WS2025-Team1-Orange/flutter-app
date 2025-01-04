// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_list200_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransactionList200ResponseDto _$GetTransactionList200ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetTransactionList200ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['donations', 'earnings', 'pagination'],
        );
        final val = GetTransactionList200ResponseDto(
          donations: $checkedConvert(
              'donations',
              (v) => (v as List<dynamic>)
                  .map((e) => DonationDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          earnings: $checkedConvert(
              'earnings',
              (v) => (v as List<dynamic>)
                  .map((e) => EarningDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pagination: $checkedConvert('pagination',
              (v) => PaginationDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$GetTransactionList200ResponseDtoToJson(
        GetTransactionList200ResponseDto instance) =>
    <String, dynamic>{
      'donations': instance.donations.map((e) => e.toJson()).toList(),
      'earnings': instance.earnings.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };
