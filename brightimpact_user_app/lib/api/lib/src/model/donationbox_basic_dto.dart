//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donationbox_basic_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationboxBasicDto {
  /// Returns a new [DonationboxBasicDto] instance.
  DonationboxBasicDto({

    required  this.id,

    required  this.cuid,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'cuid',
    required: true,
    includeIfNull: false,
  )


  final String cuid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxBasicDto &&
      other.id == id &&
      other.cuid == cuid;

    @override
    int get hashCode =>
        id.hashCode +
        cuid.hashCode;

  factory DonationboxBasicDto.fromJson(Map<String, dynamic> json) => _$DonationboxBasicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxBasicDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

