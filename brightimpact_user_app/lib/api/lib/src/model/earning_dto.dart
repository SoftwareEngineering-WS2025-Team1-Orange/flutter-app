//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/payout_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'earning_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EarningDto {
  /// Returns a new [EarningDto] instance.
  EarningDto({

    required  this.id,

    required  this.amount,

    required  this.createdAt,

    required  this.activeTimeInPeriod,

    required  this.donationBoxId,

    required  this.payout,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'amount',
    required: true,
    includeIfNull: false,
  )


  final num amount;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'activeTimeInPeriod',
    required: true,
    includeIfNull: false,
  )


  final num activeTimeInPeriod;



  @JsonKey(
    
    name: r'donationBoxId',
    required: true,
    includeIfNull: false,
  )


  final num donationBoxId;



  @JsonKey(
    
    name: r'payout',
    required: true,
    includeIfNull: false,
  )


  final PayoutDto payout;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EarningDto &&
      other.id == id &&
      other.amount == amount &&
      other.createdAt == createdAt &&
      other.activeTimeInPeriod == activeTimeInPeriod &&
      other.donationBoxId == donationBoxId &&
      other.payout == payout;

    @override
    int get hashCode =>
        id.hashCode +
        amount.hashCode +
        createdAt.hashCode +
        activeTimeInPeriod.hashCode +
        donationBoxId.hashCode +
        payout.hashCode;

  factory EarningDto.fromJson(Map<String, dynamic> json) => _$EarningDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EarningDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

