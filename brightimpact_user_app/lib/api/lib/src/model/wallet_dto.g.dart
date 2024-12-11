// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletDto _$WalletDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WalletDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['balance'],
        );
        final val = WalletDto(
          balance: $checkedConvert('balance', (v) => v as num),
        );
        return val;
      },
    );

Map<String, dynamic> _$WalletDtoToJson(WalletDto instance) => <String, dynamic>{
      'balance': instance.balance,
    };
