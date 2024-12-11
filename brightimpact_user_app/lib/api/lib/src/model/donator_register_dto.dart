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

    required  this.name,

    required  this.password,

    required  this.mail,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'mail',
    required: true,
    includeIfNull: false,
  )


  final String mail;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorRegisterDto &&
      other.name == name &&
      other.password == password &&
      other.mail == mail;

    @override
    int get hashCode =>
        name.hashCode +
        password.hashCode +
        mail.hashCode;

  factory DonatorRegisterDto.fromJson(Map<String, dynamic> json) => _$DonatorRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

