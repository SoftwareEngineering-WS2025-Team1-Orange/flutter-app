// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_donation_list200_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDonationList200ResponseDto _$GetDonationList200ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'GetDonationList200ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['donations', 'pagination'],
        );
        final val = GetDonationList200ResponseDto(
          donations: $checkedConvert(
              'donations',
              (v) => (v as List<dynamic>)
                  .map((e) => DonationDto.fromJson(e as Map<String, dynamic>))
                  .toList()),
          pagination: $checkedConvert('pagination',
              (v) => PaginationDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$GetDonationList200ResponseDtoToJson(
        GetDonationList200ResponseDto instance) =>
    <String, dynamic>{
      'donations': instance.donations.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination.toJson(),
    };
