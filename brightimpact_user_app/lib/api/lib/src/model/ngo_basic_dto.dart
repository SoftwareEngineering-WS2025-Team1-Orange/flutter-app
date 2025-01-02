//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ngo_basic_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NGOBasicDto {
  /// Returns a new [NGOBasicDto] instance.
  NGOBasicDto({

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
    bool operator ==(Object other) => identical(this, other) || other is NGOBasicDto &&
      other.name == name &&
      other.id == id;

    @override
    int get hashCode =>
        name.hashCode +
        id.hashCode;

  factory NGOBasicDto.fromJson(Map<String, dynamic> json) => _$NGOBasicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NGOBasicDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

