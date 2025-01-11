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
          amount: $checkedConvert('amount', (v) => v as num?),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonateToNgoRequestDtoToJson(
        DonateToNgoRequestDto instance) =>
    <String, dynamic>{
      if (instance.amount case final value?) 'amount': value,
    };
