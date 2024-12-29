//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donation_project_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationProjectDto {
  /// Returns a new [DonationProjectDto] instance.
  DonationProjectDto({

     this.id,

     this.name,
  });

  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationProjectDto &&
      other.id == id &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode;

  factory DonationProjectDto.fromJson(Map<String, dynamic> json) => _$DonationProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationProjectDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

