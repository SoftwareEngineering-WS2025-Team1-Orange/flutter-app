// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_status_update_request_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendStatusUpdateRequestRequestDto _$SendStatusUpdateRequestRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SendStatusUpdateRequestRequestDto',
      json,
      ($checkedConvert) {
        final val = SendStatusUpdateRequestRequestDto(
          cuid: $checkedConvert('cuid', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$SendStatusUpdateRequestRequestDtoToJson(
        SendStatusUpdateRequestRequestDto instance) =>
    <String, dynamic>{
      if (instance.cuid case final value?) 'cuid': value,
    };
