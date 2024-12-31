//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donator_register_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonatorRegisterDto {
  /// Returns a new [DonatorRegisterDto] instance.
  DonatorRegisterDto({

     this.firstName,

     this.lastName,

    required  this.password,

     this.email,
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
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorRegisterDto &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.password == password &&
      other.email == email;

    @override
    int get hashCode =>
        firstName.hashCode +
        lastName.hashCode +
        password.hashCode +
        email.hashCode;

  factory DonatorRegisterDto.fromJson(Map<String, dynamic> json) => _$DonatorRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

