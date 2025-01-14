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
          requiredKeys: const ['timestamp', 'lastPayoutTimestamp'],
        );
        final val = MoneroMiningPayoutBasicDto(
          timestamp:
              $checkedConvert('timestamp', (v) => DateTime.parse(v as String)),
          lastPayoutTimestamp: $checkedConvert(
              'lastPayoutTimestamp', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$MoneroMiningPayoutBasicDtoToJson(
        MoneroMiningPayoutBasicDto instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'lastPayoutTimestamp': instance.lastPayoutTimestamp.toIso8601String(),
    };
