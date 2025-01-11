//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donator_update_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonatorUpdateDto {
  /// Returns a new [DonatorUpdateDto] instance.
  DonatorUpdateDto({

     this.firstName,

     this.lastName,

     this.email,

     this.password,
  });

  @JsonKey(
    
    name: r'firstName',
    required: false,
    includeIfNull: false,
  )


  final String? firstName;



  @JsonKey(
    
    name: r'lastName',
    required: false,
    includeIfNull: false,
  )


  final String? lastName;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorUpdateDto &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password;

    @override
    int get hashCode =>
        firstName.hashCode +
        lastName.hashCode +
        email.hashCode +
        password.hashCode;

  factory DonatorUpdateDto.fromJson(Map<String, dynamic> json) => _$DonatorUpdateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorUpdateDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

