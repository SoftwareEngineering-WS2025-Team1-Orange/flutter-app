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
            'amountInCent',
            'payoutType',
            'payoutTimestamp',
            'moneroMiningPayout',
            'donationBox'
          ],
        );
        final val = EarningDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amountInCent:
              $checkedConvert('amountInCent', (v) => (v as num).toInt()),
          payoutType: $checkedConvert('payoutType',
              (v) => $enumDecode(_$EarningDtoPayoutTypeEnumEnumMap, v)),
          payoutTimestamp: $checkedConvert(
              'payoutTimestamp', (v) => DateTime.parse(v as String)),
          workingTimeInSeconds: $checkedConvert(
              'workingTimeInSeconds', (v) => (v as num?)?.toInt()),
          moneroMiningPayout: $checkedConvert(
              'moneroMiningPayout',
              (v) => MoneroMiningPayoutBasicDto.fromJson(
                  v as Map<String, dynamic>)),
          donationBox: $checkedConvert('donationBox',
              (v) => DonationboxBasicDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$EarningDtoToJson(EarningDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountInCent': instance.amountInCent,
      'payoutType': _$EarningDtoPayoutTypeEnumEnumMap[instance.payoutType]!,
      'payoutTimestamp': instance.payoutTimestamp.toIso8601String(),
      if (instance.workingTimeInSeconds case final value?)
        'workingTimeInSeconds': value,
      'moneroMiningPayout': instance.moneroMiningPayout.toJson(),
      'donationBox': instance.donationBox.toJson(),
    };

const _$EarningDtoPayoutTypeEnumEnumMap = {
  EarningDtoPayoutTypeEnum.MONERO_MINING: 'MONERO_MINING',
};
