//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donationbox_register_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationboxRegisterDto {
  /// Returns a new [DonationboxRegisterDto] instance.
  DonationboxRegisterDto({

    required  this.id,

     this.locLat,

     this.locLgt,

     this.powerSupplyId,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'loc_lat',
    required: false,
    includeIfNull: false,
  )


  final num? locLat;



  @JsonKey(
    
    name: r'loc_lgt',
    required: false,
    includeIfNull: false,
  )


  final num? locLgt;



  @JsonKey(
    
    name: r'power_supply_id',
    required: false,
    includeIfNull: false,
  )


  final String? powerSupplyId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxRegisterDto &&
      other.id == id &&
      other.locLat == locLat &&
      other.locLgt == locLgt &&
      other.powerSupplyId == powerSupplyId;

    @override
    int get hashCode =>
        id.hashCode +
        locLat.hashCode +
        locLgt.hashCode +
        powerSupplyId.hashCode;

  factory DonationboxRegisterDto.fromJson(Map<String, dynamic> json) => _$DonationboxRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

