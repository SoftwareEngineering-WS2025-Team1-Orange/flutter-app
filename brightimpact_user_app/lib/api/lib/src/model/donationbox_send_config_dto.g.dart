// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donationbox_send_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationboxSendConfigDto _$DonationboxSendConfigDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationboxSendConfigDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['pluginName', 'cuid', 'config'],
        );
        final val = DonationboxSendConfigDto(
          pluginName: $checkedConvert('pluginName', (v) => v as String),
          cuid: $checkedConvert('cuid', (v) => v as String),
          config: $checkedConvert(
              'config', (v) => ConfigDto.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationboxSendConfigDtoToJson(
        DonationboxSendConfigDto instance) =>
    <String, dynamic>{
      'pluginName': instance.pluginName,
      'cuid': instance.cuid,
      'config': instance.config.toJson(),
    };
