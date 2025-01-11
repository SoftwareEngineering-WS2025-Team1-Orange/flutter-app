//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donate_to_ngo201_response_all_of_project_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donation_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationResponseDto {
  /// Returns a new [DonationResponseDto] instance.
  DonationResponseDto({

    required  this.id,

    required  this.amount,

    required  this.createdAt,

    required  this.ngo,

    required  this.newBalance,
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
    
    name: r'ngo',
    required: true,
    includeIfNull: false,
  )


  final DonateToNgo201ResponseAllOfProjectDto ngo;



  @JsonKey(
    
    name: r'newBalance',
    required: true,
    includeIfNull: false,
  )


  final num newBalance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationResponseDto &&
      other.id == id &&
      other.amount == amount &&
      other.createdAt == createdAt &&
      other.ngo == ngo &&
      other.newBalance == newBalance;

    @override
    int get hashCode =>
        id.hashCode +
        amount.hashCode +
        createdAt.hashCode +
        ngo.hashCode +
        newBalance.hashCode;

  factory DonationResponseDto.fromJson(Map<String, dynamic> json) => _$DonationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

