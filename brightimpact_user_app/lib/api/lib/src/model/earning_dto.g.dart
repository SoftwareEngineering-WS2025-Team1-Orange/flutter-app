// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarningDto _$EarningDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'EarningDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'amount',
            'createdAt',
            'activeTimeInPeriod',
            'donationBoxId',
            'payout'
          ],
        );
        final val = EarningDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amount: $checkedConvert('amount', (v) => v as num),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          activeTimeInPeriod:
              $checkedConvert('activeTimeInPeriod', (v) => v as num),
          donationBoxId: $checkedConvert('donationBoxId', (v) => v as num),
          payout: $checkedConvert(
              'payout', (v) => PayoutDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$EarningDtoToJson(EarningDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'activeTimeInPeriod': instance.activeTimeInPeriod,
      'donationBoxId': instance.donationBoxId,
      'payout': instance.payout.toJson(),
    };
