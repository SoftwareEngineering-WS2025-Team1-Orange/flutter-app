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

    required  this.firstname,

    required  this.lastname,

    required  this.mail,

    required  this.balance,

    required  this.id,
  });

  @JsonKey(
    
    name: r'firstname',
    required: true,
    includeIfNull: false,
  )


  final String firstname;



  @JsonKey(
    
    name: r'lastname',
    required: true,
    includeIfNull: false,
  )


  final String lastname;



  @JsonKey(
    
    name: r'mail',
    required: true,
    includeIfNull: false,
  )


  final String mail;



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
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.mail == mail &&
      other.balance == balance &&
      other.id == id;

    @override
    int get hashCode =>
        firstname.hashCode +
        lastname.hashCode +
        mail.hashCode +
        balance.hashCode +
        id.hashCode;

  factory DonatorDto.fromJson(Map<String, dynamic> json) => _$DonatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

