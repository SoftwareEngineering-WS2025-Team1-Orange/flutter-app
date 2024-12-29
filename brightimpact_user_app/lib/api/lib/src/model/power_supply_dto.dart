//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'power_supply_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PowerSupplyDto {
  /// Returns a new [PowerSupplyDto] instance.
  PowerSupplyDto({

    required  this.id,

    required  this.type,

    required  this.lastStatus,

    required  this.powerSurplus,

    required  this.name,

    required  this.modelNumber,

    required  this.apiConfig,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final PowerSupplyDtoTypeEnum type;



  @JsonKey(
    
    name: r'last_status',
    required: true,
    includeIfNull: false,
  )


  final PowerSupplyDtoLastStatusEnum lastStatus;



  @JsonKey(
    
    name: r'power_surplus',
    required: true,
    includeIfNull: false,
  )


  final num powerSurplus;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'model_number',
    required: true,
    includeIfNull: false,
  )


  final String modelNumber;



      /// Flexible JSON string that contains attributes depending on the model number
  @JsonKey(
    
    name: r'api_config',
    required: true,
    includeIfNull: false,
  )


  final String apiConfig;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PowerSupplyDto &&
      other.id == id &&
      other.type == type &&
      other.lastStatus == lastStatus &&
      other.powerSurplus == powerSurplus &&
      other.name == name &&
      other.modelNumber == modelNumber &&
      other.apiConfig == apiConfig;

    @override
    int get hashCode =>
        id.hashCode +
        type.hashCode +
        lastStatus.hashCode +
        powerSurplus.hashCode +
        name.hashCode +
        modelNumber.hashCode +
        apiConfig.hashCode;

  factory PowerSupplyDto.fromJson(Map<String, dynamic> json) => _$PowerSupplyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum PowerSupplyDtoTypeEnum {
@JsonValue(r'Solar')
solar(r'Solar'),
@JsonValue(r'Alternative')
alternative(r'Alternative');

const PowerSupplyDtoTypeEnum(this.value);

final String value;

@override
String toString() => value;
}



enum PowerSupplyDtoLastStatusEnum {
@JsonValue(r'OFFLINE')
OFFLINE(r'OFFLINE'),
@JsonValue(r'CONNECTED')
CONNECTED(r'CONNECTED'),
@JsonValue(r'INVALID_AUTH')
INVALID_AUTH(r'INVALID_AUTH'),
@JsonValue(r'ERROR')
ERROR(r'ERROR');

const PowerSupplyDtoLastStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


