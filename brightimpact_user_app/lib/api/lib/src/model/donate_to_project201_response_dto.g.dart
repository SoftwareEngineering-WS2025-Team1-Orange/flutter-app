// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donate_to_project201_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonateToProject201ResponseDto _$DonateToProject201ResponseDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'DonateToProject201ResponseDto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'id',
            'amountInCent',
            'createdAt',
            'ngo',
            'newBalance',
            'project'
          ],
        );
        final val = DonateToProject201ResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amountInCent:
              $checkedConvert('amountInCent', (v) => (v as num).toInt()),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          ngo: $checkedConvert(
              'ngo',
              (v) => DonateToNgo201ResponseAllOfProjectDto.fromJson(
                  v as Map<String, dynamic>)),
          newBalance: $checkedConvert('newBalance', (v) => v as num),
          project: $checkedConvert(
              'project',
              (v) => DonateToNgo201ResponseAllOfProjectDto.fromJson(
                  v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonateToProject201ResponseDtoToJson(
        DonateToProject201ResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amountInCent': instance.amountInCent,
      'createdAt': instance.createdAt.toIso8601String(),
      'ngo': instance.ngo.toJson(),
      'newBalance': instance.newBalance,
      'project': instance.project.toJson(),
    };
