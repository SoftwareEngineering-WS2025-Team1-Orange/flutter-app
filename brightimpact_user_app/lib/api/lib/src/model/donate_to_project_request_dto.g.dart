// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_to_project_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateToProjectRequestDto _$DonateToProjectRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonateToProjectRequestDto',
      json,
      ($checkedConvert) {
        final val = DonateToProjectRequestDto(
          amountInCent:
              $checkedConvert('amountInCent', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonateToProjectRequestDtoToJson(
        DonateToProjectRequestDto instance) =>
    <String, dynamic>{
      if (instance.amountInCent case final value?) 'amountInCent': value,
    };
