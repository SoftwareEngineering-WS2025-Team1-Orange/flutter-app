// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_to_ngo201_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateToNgo201ResponseDto _$DonateToNgo201ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonateToNgo201ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'amount',
            'createdAt',
            'ngo',
            'newBalance'
          ],
        );
        final val = DonateToNgo201ResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amount: $checkedConvert('amount', (v) => v as num),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          ngo: $checkedConvert(
              'ngo',
              (v) => DonateToNgo201ResponseAllOfProjectDto.fromJson(
                  v as Map<String, dynamic>)),
          newBalance: $checkedConvert('newBalance', (v) => v as num),
          project: $checkedConvert(
              'project',
              (v) => v == null
                  ? null
                  : DonateToNgo201ResponseAllOfProjectDto.fromJson(
                      v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonateToNgo201ResponseDtoToJson(
        DonateToNgo201ResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'ngo': instance.ngo.toJson(),
      'newBalance': instance.newBalance,
      if (instance.project?.toJson() case final value?) 'project': value,
    };
