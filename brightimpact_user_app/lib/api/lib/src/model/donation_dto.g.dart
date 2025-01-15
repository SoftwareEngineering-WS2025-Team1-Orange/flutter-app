// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationDto _$DonationDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DonationDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id', 'amountInCent', 'ngo', 'createdAt'],
        );
        final val = DonationDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amountInCent:
              $checkedConvert('amountInCent', (v) => (v as num).toInt()),
          project: $checkedConvert(
              'project',
              (v) => v == null
                  ? null
                  : ProjectBasicDto.fromJson(v as Map<String, dynamic>)),
          ngo: $checkedConvert(
              'ngo', (v) => NGOBasicDto.fromJson(v as Map<String, dynamic>)),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationDtoToJson(DonationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountInCent': instance.amountInCent,
      if (instance.project?.toJson() case final value?) 'project': value,
      'ngo': instance.ngo.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
