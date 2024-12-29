// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_ngo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationNgoDto _$DonationNgoDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationNgoDto',
      json,
      ($checkedConvert) {
        final val = DonationNgoDto(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationNgoDtoToJson(DonationNgoDto instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };
