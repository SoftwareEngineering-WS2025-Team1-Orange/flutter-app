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

    required  this.mail,

    required  this.password,
  });

  @JsonKey(
    
    name: r'mail',
    required: true,
    includeIfNull: false,
  )


  final String mail;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorLoginDto &&
      other.mail == mail &&
      other.password == password;

    @override
    int get hashCode =>
        mail.hashCode +
        password.hashCode;

  factory DonatorLoginDto.fromJson(Map<String, dynamic> json) => _$DonatorLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorLoginDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

