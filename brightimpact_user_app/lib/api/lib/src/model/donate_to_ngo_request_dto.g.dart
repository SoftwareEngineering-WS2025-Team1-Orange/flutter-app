// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_to_ngo_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateToNgoRequestDto _$DonateToNgoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonateToNgoRequestDto',
      json,
      ($checkedConvert) {
        final val = DonateToNgoRequestDto(
          amountInCent:
              $checkedConvert('amountInCent', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonateToNgoRequestDtoToJson(
        DonateToNgoRequestDto instance) =>
    <String, dynamic>{
      if (instance.amountInCent case final value?) 'amountInCent': value,
    };
