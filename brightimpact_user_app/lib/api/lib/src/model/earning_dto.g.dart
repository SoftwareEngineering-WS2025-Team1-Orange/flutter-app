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
            'createdAt',
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
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          payoutType: $checkedConvert('payoutType',
              (v) => $enumDecode(_$EarningDtoPayoutTypeEnumEnumMap, v)),
          payoutTimestamp: $checkedConvert(
              'payoutTimestamp', (v) => DateTime.parse(v as String)),
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
      'createdAt': instance.createdAt.toIso8601String(),
      'payoutType': _$EarningDtoPayoutTypeEnumEnumMap[instance.payoutType]!,
      'payoutTimestamp': instance.payoutTimestamp.toIso8601String(),
      'moneroMiningPayout': instance.moneroMiningPayout.toJson(),
      'donationBox': instance.donationBox.toJson(),
    };

const _$EarningDtoPayoutTypeEnumEnumMap = {
  EarningDtoPayoutTypeEnum.MONERO_MINING: 'MONERO_MINING',
};
