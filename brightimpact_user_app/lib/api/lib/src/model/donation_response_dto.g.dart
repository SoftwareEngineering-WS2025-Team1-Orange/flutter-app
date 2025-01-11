// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonationResponseDto _$DonationResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DonationResponseDto',
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
        final val = DonationResponseDto(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          amount: $checkedConvert('amount', (v) => v as num),
          createdAt:
              $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
          ngo: $checkedConvert(
              'ngo',
              (v) => DonateToNgo201ResponseAllOfProjectDto.fromJson(
                  v as Map<String, dynamic>)),
          newBalance: $checkedConvert('newBalance', (v) => v as num),
        );
        return val;
      },
    );

Map<String, dynamic> _$DonationResponseDtoToJson(
        DonationResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'ngo': instance.ngo.toJson(),
      'newBalance': instance.newBalance,
    };
