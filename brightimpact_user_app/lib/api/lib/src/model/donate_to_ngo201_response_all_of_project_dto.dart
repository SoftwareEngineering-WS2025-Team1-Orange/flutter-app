//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donate_to_ngo201_response_all_of_project_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonateToNgo201ResponseAllOfProjectDto {
  /// Returns a new [DonateToNgo201ResponseAllOfProjectDto] instance.
  DonateToNgo201ResponseAllOfProjectDto({

    required  this.name,

    required  this.id,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonateToNgo201ResponseAllOfProjectDto &&
      other.name == name &&
      other.id == id;

    @override
    int get hashCode =>
        name.hashCode +
        id.hashCode;

  factory DonateToNgo201ResponseAllOfProjectDto.fromJson(Map<String, dynamic> json) => _$DonateToNgo201ResponseAllOfProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonateToNgo201ResponseAllOfProjectDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

