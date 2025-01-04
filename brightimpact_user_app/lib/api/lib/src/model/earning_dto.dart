//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donationbox_basic_dto.dart';
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

    required  this.payout,

    required  this.donationBox,
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
    
    name: r'payout',
    required: true,
    includeIfNull: false,
  )


  final PayoutDto payout;



  @JsonKey(
    
    name: r'donationBox',
    required: true,
    includeIfNull: false,
  )


  final DonationboxBasicDto donationBox;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EarningDto &&
      other.id == id &&
      other.amount == amount &&
      other.createdAt == createdAt &&
      other.activeTimeInPeriod == activeTimeInPeriod &&
      other.payout == payout &&
      other.donationBox == donationBox;

    @override
    int get hashCode =>
        id.hashCode +
        amount.hashCode +
        createdAt.hashCode +
        activeTimeInPeriod.hashCode +
        payout.hashCode +
        donationBox.hashCode;

  factory EarningDto.fromJson(Map<String, dynamic> json) => _$EarningDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EarningDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

