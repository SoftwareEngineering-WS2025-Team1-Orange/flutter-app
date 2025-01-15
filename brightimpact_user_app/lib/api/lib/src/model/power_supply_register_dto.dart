//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'power_supply_register_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PowerSupplyRegisterDto {
  /// Returns a new [PowerSupplyRegisterDto] instance.
  PowerSupplyRegisterDto({

    required  this.name,

    required  this.modelNumber,

    required  this.apiConfig,

    required  this.type,
  });

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



  @JsonKey(
    
    name: r'type',
    required: true,
    includeIfNull: false,
  )


  final PowerSupplyRegisterDtoTypeEnum type;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PowerSupplyRegisterDto &&
      other.name == name &&
      other.modelNumber == modelNumber &&
      other.apiConfig == apiConfig &&
      other.type == type;

    @override
    int get hashCode =>
        name.hashCode +
        modelNumber.hashCode +
        apiConfig.hashCode +
        type.hashCode;

  factory PowerSupplyRegisterDto.fromJson(Map<String, dynamic> json) => _$PowerSupplyRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum PowerSupplyRegisterDtoTypeEnum {
@JsonValue(r'Solar')
solar(r'Solar'),
@JsonValue(r'Alternative')
alternative(r'Alternative');

const PowerSupplyRegisterDtoTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


