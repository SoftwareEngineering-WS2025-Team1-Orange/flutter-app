//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'config_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigDto {
  /// Returns a new [ConfigDto] instance.
  ConfigDto({

    required  this.e3dcUser,

    required  this.e3dcPassword,

    required  this.e3dcSerial,
  });

  @JsonKey(
    
    name: r'e3dc_user',
    required: true,
    includeIfNull: false,
  )


  final String e3dcUser;



  @JsonKey(
    
    name: r'e3dc_password',
    required: true,
    includeIfNull: false,
  )


  final String e3dcPassword;



  @JsonKey(
    
    name: r'e3dc_serial',
    required: true,
    includeIfNull: false,
  )


  final String e3dcSerial;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigDto &&
      other.e3dcUser == e3dcUser &&
      other.e3dcPassword == e3dcPassword &&
      other.e3dcSerial == e3dcSerial;

    @override
    int get hashCode =>
        e3dcUser.hashCode +
        e3dcPassword.hashCode +
        e3dcSerial.hashCode;

  factory ConfigDto.fromJson(Map<String, dynamic> json) => _$ConfigDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

