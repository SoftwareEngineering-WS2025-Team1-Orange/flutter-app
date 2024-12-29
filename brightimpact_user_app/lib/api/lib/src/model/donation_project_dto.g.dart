// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationProjectDto _$DonationProjectDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationProjectDto',
      json,
      ($checkedConvert) {
        final val = DonationProjectDto(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationProjectDtoToJson(DonationProjectDto instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.name case final value?) 'name': value,
    };
