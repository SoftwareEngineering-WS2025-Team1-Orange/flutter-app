//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/last_solar_data_consumption_dto.dart';
import 'package:openapi/src/model/last_solar_data_production_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'last_solar_data_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LastSolarDataDto {
  /// Returns a new [LastSolarDataDto] instance.
  LastSolarDataDto({

     this.sysStatus,

     this.stateOfCharge,

    required  this.production,

    required  this.consumption,
  });

      /// The system status code.
  @JsonKey(
    
    name: r'sysStatus',
    required: false,
    includeIfNull: false,
  )


  final int? sysStatus;



      /// State of charge as a percentage.
  @JsonKey(
    
    name: r'stateOfCharge',
    required: false,
    includeIfNull: false,
  )


  final double? stateOfCharge;



  @JsonKey(
    
    name: r'production',
    required: true,
    includeIfNull: false,
  )


  final LastSolarDataProductionDto production;



  @JsonKey(
    
    name: r'consumption',
    required: true,
    includeIfNull: false,
  )


  final LastSolarDataConsumptionDto consumption;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LastSolarDataDto &&
      other.sysStatus == sysStatus &&
      other.stateOfCharge == stateOfCharge &&
      other.production == production &&
      other.consumption == consumption;

    @override
    int get hashCode =>
        sysStatus.hashCode +
        stateOfCharge.hashCode +
        production.hashCode +
        consumption.hashCode;

  factory LastSolarDataDto.fromJson(Map<String, dynamic> json) => _$LastSolarDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LastSolarDataDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

