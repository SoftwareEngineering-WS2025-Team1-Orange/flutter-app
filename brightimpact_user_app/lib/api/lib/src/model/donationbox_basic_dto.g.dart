// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donationbox_basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationboxBasicDto _$DonationboxBasicDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationboxBasicDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['id'],
        );
        final val = DonationboxBasicDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          cuid: $checkedConvert('cuid', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationboxBasicDtoToJson(
        DonationboxBasicDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.cuid case final value?) 'cuid': value,
      if (instance.name case final value?) 'name': value,
    };
