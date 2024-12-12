//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donationbox_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationboxDto {
  /// Returns a new [DonationboxDto] instance.
  DonationboxDto({

    required  this.id,

    required  this.state,

    required  this.powerConsumption,

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
    
    name: r'state',
    required: true,
    includeIfNull: false,
  )


  final DonationboxDtoStateEnum state;



  @JsonKey(
    
    name: r'power_consumption',
    required: true,
    includeIfNull: false,
  )


  final num powerConsumption;



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
    bool operator ==(Object other) => identical(this, other) || other is DonationboxDto &&
      other.id == id &&
      other.state == state &&
      other.powerConsumption == powerConsumption &&
      other.locLat == locLat &&
      other.locLgt == locLgt &&
      other.powerSupplyId == powerSupplyId;

    @override
    int get hashCode =>
        id.hashCode +
        state.hashCode +
        powerConsumption.hashCode +
        locLat.hashCode +
        locLgt.hashCode +
        powerSupplyId.hashCode;

  factory DonationboxDto.fromJson(Map<String, dynamic> json) => _$DonationboxDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DonationboxDtoStateEnum {
@JsonValue(r'OFFLINE')
OFFLINE(r'OFFLINE'),
@JsonValue(r'CONNECTED')
CONNECTED(r'CONNECTED'),
@JsonValue(r'READY')
READY(r'READY'),
@JsonValue(r'RUNNING')
RUNNING(r'RUNNING'),
@JsonValue(r'ERROR')
ERROR(r'ERROR');

const DonationboxDtoStateEnum(this.value);

final String value;

@override
String toString() => value;
}


