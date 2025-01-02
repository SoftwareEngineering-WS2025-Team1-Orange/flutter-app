//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/project_basic_dto.dart';
import 'package:openapi/src/model/ngo_basic_dto.dart';
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

     this.project,

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
    required: false,
    includeIfNull: false,
  )


  final ProjectBasicDto? project;



  @JsonKey(
    
    name: r'ngo',
    required: true,
    includeIfNull: false,
  )


  final NGOBasicDto ngo;



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

