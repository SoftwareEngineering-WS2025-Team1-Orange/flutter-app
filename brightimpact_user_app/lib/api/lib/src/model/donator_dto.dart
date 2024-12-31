//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donator_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonatorDto {
  /// Returns a new [DonatorDto] instance.
  DonatorDto({

    required  this.firstName,

    required  this.lastName,

    required  this.email,

    required  this.balance,

    required  this.id,
  });

  @JsonKey(
    
    name: r'firstName',
    required: true,
    includeIfNull: false,
  )


  final String firstName;



  @JsonKey(
    
    name: r'lastName',
    required: true,
    includeIfNull: false,
  )


  final String lastName;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'balance',
    required: true,
    includeIfNull: false,
  )


  final num balance;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorDto &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.balance == balance &&
      other.id == id;

    @override
    int get hashCode =>
        firstName.hashCode +
        lastName.hashCode +
        email.hashCode +
        balance.hashCode +
        id.hashCode;

  factory DonatorDto.fromJson(Map<String, dynamic> json) => _$DonatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

