//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donator_login_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonatorLoginDto {
  /// Returns a new [DonatorLoginDto] instance.
  DonatorLoginDto({

    required  this.email,

    required  this.password,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorLoginDto &&
      other.email == email &&
      other.password == password;

    @override
    int get hashCode =>
        email.hashCode +
        password.hashCode;

  factory DonatorLoginDto.fromJson(Map<String, dynamic> json) => _$DonatorLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorLoginDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

