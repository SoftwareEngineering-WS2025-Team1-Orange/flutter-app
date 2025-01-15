//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/monero_mining_payout_basic_dto.dart';
import 'package:openapi/src/model/donationbox_basic_dto.dart';
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

    required  this.amountInCent,

    required  this.payoutType,

    required  this.payoutTimestamp,

     this.workingTimeInSeconds,

    required  this.moneroMiningPayout,

    required  this.donationBox,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'amountInCent',
    required: true,
    includeIfNull: false,
  )


  final int amountInCent;



  @JsonKey(
    
    name: r'payoutType',
    required: true,
    includeIfNull: false,
  )


  final EarningDtoPayoutTypeEnum payoutType;



  @JsonKey(
    
    name: r'payoutTimestamp',
    required: true,
    includeIfNull: false,
  )


  final DateTime payoutTimestamp;



  @JsonKey(
    
    name: r'workingTimeInSeconds',
    required: false,
    includeIfNull: false,
  )


  final int? workingTimeInSeconds;



  @JsonKey(
    
    name: r'moneroMiningPayout',
    required: true,
    includeIfNull: false,
  )


  final MoneroMiningPayoutBasicDto moneroMiningPayout;



  @JsonKey(
    
    name: r'donationBox',
    required: true,
    includeIfNull: false,
  )


  final DonationboxBasicDto donationBox;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EarningDto &&
      other.id == id &&
      other.amountInCent == amountInCent &&
      other.payoutType == payoutType &&
      other.payoutTimestamp == payoutTimestamp &&
      other.workingTimeInSeconds == workingTimeInSeconds &&
      other.moneroMiningPayout == moneroMiningPayout &&
      other.donationBox == donationBox;

    @override
    int get hashCode =>
        id.hashCode +
        amountInCent.hashCode +
        payoutType.hashCode +
        payoutTimestamp.hashCode +
        workingTimeInSeconds.hashCode +
        moneroMiningPayout.hashCode +
        donationBox.hashCode;

  factory EarningDto.fromJson(Map<String, dynamic> json) => _$EarningDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EarningDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum EarningDtoPayoutTypeEnum {
@JsonValue(r'MONERO_MINING')
MONERO_MINING(r'MONERO_MINING');

const EarningDtoPayoutTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


