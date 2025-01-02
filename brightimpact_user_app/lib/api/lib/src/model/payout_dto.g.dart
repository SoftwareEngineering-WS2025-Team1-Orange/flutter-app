// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayoutDto _$PayoutDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PayoutDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['periodStart', 'periodEnd'],
        );
        final val = PayoutDto(
          periodStart: $checkedConvert(
              'periodStart', (v) => DateTime.parse(v as String)),
          periodEnd:
              $checkedConvert('periodEnd', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PayoutDtoToJson(PayoutDto instance) => <String, dynamic>{
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
    };
