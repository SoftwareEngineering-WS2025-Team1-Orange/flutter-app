// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monero_mining_payout_basic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneroMiningPayoutBasicDto _$MoneroMiningPayoutBasicDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'MoneroMiningPayoutBasicDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['timestamp', 'periodStart'],
        );
        final val = MoneroMiningPayoutBasicDto(
          timestamp:
              $checkedConvert('timestamp', (v) => DateTime.parse(v as String)),
          periodStart: $checkedConvert(
              'periodStart', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$MoneroMiningPayoutBasicDtoToJson(
        MoneroMiningPayoutBasicDto instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'periodStart': instance.periodStart.toIso8601String(),
    };
