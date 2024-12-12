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

     this.apiKey,

     this.ip,

     this.password,
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



  @JsonKey(
    
    name: r'api_key',
    required: false,
    includeIfNull: false,
  )


  final String? apiKey;



  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PowerSupplyRegisterDto &&
      other.name == name &&
      other.modelNumber == modelNumber &&
      other.apiKey == apiKey &&
      other.ip == ip &&
      other.password == password;

    @override
    int get hashCode =>
        name.hashCode +
        modelNumber.hashCode +
        apiKey.hashCode +
        ip.hashCode +
        password.hashCode;

  factory PowerSupplyRegisterDto.fromJson(Map<String, dynamic> json) => _$PowerSupplyRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

