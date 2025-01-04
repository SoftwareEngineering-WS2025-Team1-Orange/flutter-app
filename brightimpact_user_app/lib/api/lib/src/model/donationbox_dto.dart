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

    required  this.cuid,

    required  this.name,

    required  this.lastStatus,

     this.powerConsumption,

     this.powerSupplyId,
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



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'last_status',
    required: true,
    includeIfNull: false,
  )


  final DonationboxDtoLastStatusEnum lastStatus;



  @JsonKey(
    
    name: r'power_consumption',
    required: false,
    includeIfNull: false,
  )


  final num? powerConsumption;



  @JsonKey(
    
    name: r'powerSupplyId',
    required: false,
    includeIfNull: false,
  )


  final String? powerSupplyId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxDto &&
      other.id == id &&
      other.cuid == cuid &&
      other.name == name &&
      other.lastStatus == lastStatus &&
      other.powerConsumption == powerConsumption &&
      other.powerSupplyId == powerSupplyId;

    @override
    int get hashCode =>
        id.hashCode +
        cuid.hashCode +
        name.hashCode +
        lastStatus.hashCode +
        powerConsumption.hashCode +
        powerSupplyId.hashCode;

  factory DonationboxDto.fromJson(Map<String, dynamic> json) => _$DonationboxDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DonationboxDtoLastStatusEnum {
@JsonValue(r'OFFLINE')
OFFLINE(r'OFFLINE'),
@JsonValue(r'ERROR')
ERROR(r'ERROR'),
@JsonValue(r'CONNECTED')
CONNECTED(r'CONNECTED'),
@JsonValue(r'READY')
READY(r'READY'),
@JsonValue(r'WORKING')
WORKING(r'WORKING');

const DonationboxDtoLastStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


