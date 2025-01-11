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
            'amount',
            'createdAt',
            'ngo',
            'newBalance',
            'project'
          ],
        );
        final val = DonateToProject201ResponseDto(
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
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'ngo': instance.ngo.toJson(),
      'newBalance': instance.newBalance,
      'project': instance.project.toJson(),
    };
