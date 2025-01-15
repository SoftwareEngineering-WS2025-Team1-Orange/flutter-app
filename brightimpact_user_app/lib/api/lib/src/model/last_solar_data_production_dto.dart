//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'last_solar_data_production_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LastSolarDataProductionDto {
  /// Returns a new [LastSolarDataProductionDto] instance.
  LastSolarDataProductionDto({

     this.solar,

     this.add,

     this.grid,
  });

      /// Solar production value.
  @JsonKey(
    
    name: r'solar',
    required: false,
    includeIfNull: false,
  )


  final double? solar;



      /// Additional production value.
  @JsonKey(
    
    name: r'add',
    required: false,
    includeIfNull: false,
  )


  final double? add;



      /// Grid production value.
  @JsonKey(
    
    name: r'grid',
    required: false,
    includeIfNull: false,
  )


  final double? grid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LastSolarDataProductionDto &&
      other.solar == solar &&
      other.add == add &&
      other.grid == grid;

    @override
    int get hashCode =>
        solar.hashCode +
        add.hashCode +
        grid.hashCode;

  factory LastSolarDataProductionDto.fromJson(Map<String, dynamic> json) => _$LastSolarDataProductionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LastSolarDataProductionDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

