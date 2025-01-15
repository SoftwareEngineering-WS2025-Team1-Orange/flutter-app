//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'last_solar_data_consumption_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LastSolarDataConsumptionDto {
  /// Returns a new [LastSolarDataConsumptionDto] instance.
  LastSolarDataConsumptionDto({

     this.battery,

     this.house,

     this.wallbox,
  });

      /// Battery consumption value.
  @JsonKey(
    
    name: r'battery',
    required: false,
    includeIfNull: false,
  )


  final double? battery;



      /// House consumption value.
  @JsonKey(
    
    name: r'house',
    required: false,
    includeIfNull: false,
  )


  final double? house;



      /// Wallbox consumption value.
  @JsonKey(
    
    name: r'wallbox',
    required: false,
    includeIfNull: false,
  )


  final double? wallbox;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LastSolarDataConsumptionDto &&
      other.battery == battery &&
      other.house == house &&
      other.wallbox == wallbox;

    @override
    int get hashCode =>
        battery.hashCode +
        house.hashCode +
        wallbox.hashCode;

  factory LastSolarDataConsumptionDto.fromJson(Map<String, dynamic> json) => _$LastSolarDataConsumptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LastSolarDataConsumptionDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

