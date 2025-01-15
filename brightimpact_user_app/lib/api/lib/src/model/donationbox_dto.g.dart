// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donationbox_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationboxDto _$DonationboxDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationboxDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'name',
            'cuid',
            'status',
            'solarStatus',
            'earningsLastUpdateSuccessful'
          ],
        );
        final val = DonationboxDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          cuid: $checkedConvert('cuid', (v) => v as String),
          lastSolarData: $checkedConvert(
              'lastSolarData',
              (v) => v == null
                  ? null
                  : LastSolarDataDto.fromJson(v as Map<String, dynamic>)),
          solarDataLastSuccessfulUpdateAt: $checkedConvert(
              'solarDataLastSuccessfulUpdateAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          averageWorkingTimePerDayInSeconds: $checkedConvert(
              'averageWorkingTimePerDayInSeconds', (v) => v as num?),
          averageWorkingTimePerDayInSecondsLastUpdateAt: $checkedConvert(
              'averageWorkingTimePerDayInSecondsLastUpdateAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          averageIncomePerDayInCent:
              $checkedConvert('averageIncomePerDayInCent', (v) => v as num?),
          averageIncomePerDayLastUpdateAt: $checkedConvert(
              'averageIncomePerDayLastUpdateAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          status: $checkedConvert('status',
              (v) => $enumDecode(_$DonationboxDtoStatusEnumEnumMap, v)),
          solarStatus: $checkedConvert('solarStatus',
              (v) => $enumDecode(_$DonationboxDtoSolarStatusEnumEnumMap, v)),
          earningsLastSuccessfulUpdateAt: $checkedConvert(
              'earningsLastSuccessfulUpdateAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          earningsLastUpdateSuccessful:
              $checkedConvert('earningsLastUpdateSuccessful', (v) => v as bool),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationboxDtoToJson(DonationboxDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cuid': instance.cuid,
      if (instance.lastSolarData?.toJson() case final value?)
        'lastSolarData': value,
      if (instance.solarDataLastSuccessfulUpdateAt?.toIso8601String()
          case final value?)
        'solarDataLastSuccessfulUpdateAt': value,
      if (instance.averageWorkingTimePerDayInSeconds case final value?)
        'averageWorkingTimePerDayInSeconds': value,
      if (instance.averageWorkingTimePerDayInSecondsLastUpdateAt
              ?.toIso8601String()
          case final value?)
        'averageWorkingTimePerDayInSecondsLastUpdateAt': value,
      if (instance.averageIncomePerDayInCent case final value?)
        'averageIncomePerDayInCent': value,
      if (instance.averageIncomePerDayLastUpdateAt?.toIso8601String()
          case final value?)
        'averageIncomePerDayLastUpdateAt': value,
      'status': _$DonationboxDtoStatusEnumEnumMap[instance.status]!,
      'solarStatus':
          _$DonationboxDtoSolarStatusEnumEnumMap[instance.solarStatus]!,
      if (instance.earningsLastSuccessfulUpdateAt?.toIso8601String()
          case final value?)
        'earningsLastSuccessfulUpdateAt': value,
      'earningsLastUpdateSuccessful': instance.earningsLastUpdateSuccessful,
    };

const _$DonationboxDtoStatusEnumEnumMap = {
  DonationboxDtoStatusEnum.connected: 'Connected',
  DonationboxDtoStatusEnum.disconnected: 'Disconnected',
  DonationboxDtoStatusEnum.working: 'Working',
  DonationboxDtoStatusEnum.uninitialized: 'Uninitialized',
  DonationboxDtoStatusEnum.unknownStatusCode: 'Unknown_Status_Code',
};

const _$DonationboxDtoSolarStatusEnumEnumMap = {
  DonationboxDtoSolarStatusEnum.ok: 'Ok',
  DonationboxDtoSolarStatusEnum.error: 'Error',
  DonationboxDtoSolarStatusEnum.pending: 'Pending',
  DonationboxDtoSolarStatusEnum.uninitialized: 'Uninitialized',
};
