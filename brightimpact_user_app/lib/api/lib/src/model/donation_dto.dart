//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donation_ngo_dto.dart';
import 'package:openapi/src/model/donation_project_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donation_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationDto {
  /// Returns a new [DonationDto] instance.
  DonationDto({

    required  this.id,

    required  this.amount,

    required  this.project,

    required  this.ngo,

    required  this.createdAt,
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
    
    name: r'project',
    required: true,
    includeIfNull: false,
  )


  final DonationProjectDto project;



  @JsonKey(
    
    name: r'ngo',
    required: true,
    includeIfNull: false,
  )


  final DonationNgoDto ngo;



  @JsonKey(
    
    name: r'createdAt',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationDto &&
      other.id == id &&
      other.amount == amount &&
      other.project == project &&
      other.ngo == ngo &&
      other.createdAt == createdAt;

    @override
    int get hashCode =>
        id.hashCode +
        amount.hashCode +
        project.hashCode +
        ngo.hashCode +
        createdAt.hashCode;

  factory DonationDto.fromJson(Map<String, dynamic> json) => _$DonationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

