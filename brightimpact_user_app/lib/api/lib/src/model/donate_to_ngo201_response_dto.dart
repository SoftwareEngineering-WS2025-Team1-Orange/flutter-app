//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donate_to_ngo201_response_all_of_project_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donate_to_ngo201_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonateToNgo201ResponseDto {
  /// Returns a new [DonateToNgo201ResponseDto] instance.
  DonateToNgo201ResponseDto({

    required  this.id,

    required  this.amountInCent,

    required  this.createdAt,

    required  this.ngo,

    required  this.newBalance,

     this.project,
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



  @JsonKey(
    
    name: r'project',
    required: false,
    includeIfNull: false,
  )


  final DonateToNgo201ResponseAllOfProjectDto? project;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonateToNgo201ResponseDto &&
      other.id == id &&
      other.amountInCent == amountInCent &&
      other.createdAt == createdAt &&
      other.ngo == ngo &&
      other.newBalance == newBalance &&
      other.project == project;

    @override
    int get hashCode =>
        id.hashCode +
        amountInCent.hashCode +
        createdAt.hashCode +
        ngo.hashCode +
        newBalance.hashCode +
        project.hashCode;

  factory DonateToNgo201ResponseDto.fromJson(Map<String, dynamic> json) => _$DonateToNgo201ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonateToNgo201ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

