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

    required  this.name,

    required  this.mail,

    required  this.donatorId,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'mail',
    required: true,
    includeIfNull: false,
  )


  final String mail;



  @JsonKey(
    
    name: r'donator_id',
    required: true,
    includeIfNull: false,
  )


  final int donatorId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonatorDto &&
      other.name == name &&
      other.mail == mail &&
      other.donatorId == donatorId;

    @override
    int get hashCode =>
        name.hashCode +
        mail.hashCode +
        donatorId.hashCode;

  factory DonatorDto.fromJson(Map<String, dynamic> json) => _$DonatorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonatorDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

