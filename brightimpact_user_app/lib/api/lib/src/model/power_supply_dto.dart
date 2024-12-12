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

    required  this.supplyType,

    required  this.isOnline,

    required  this.powerSurplus,

    required  this.name,

    required  this.modelNumber,

     this.apiKey,

     this.ip,

     this.password,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'supply_type',
    required: true,
    includeIfNull: false,
  )


  final PowerSupplyDtoSupplyTypeEnum supplyType;



  @JsonKey(
    
    name: r'is_online',
    required: true,
    includeIfNull: false,
  )


  final bool isOnline;



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
    bool operator ==(Object other) => identical(this, other) || other is PowerSupplyDto &&
      other.id == id &&
      other.supplyType == supplyType &&
      other.isOnline == isOnline &&
      other.powerSurplus == powerSurplus &&
      other.name == name &&
      other.modelNumber == modelNumber &&
      other.apiKey == apiKey &&
      other.ip == ip &&
      other.password == password;

    @override
    int get hashCode =>
        id.hashCode +
        supplyType.hashCode +
        isOnline.hashCode +
        powerSurplus.hashCode +
        name.hashCode +
        modelNumber.hashCode +
        apiKey.hashCode +
        ip.hashCode +
        password.hashCode;

  factory PowerSupplyDto.fromJson(Map<String, dynamic> json) => _$PowerSupplyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PowerSupplyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum PowerSupplyDtoSupplyTypeEnum {
@JsonValue(r'Solar')
solar(r'Solar'),
@JsonValue(r'Alternative')
alternative(r'Alternative');

const PowerSupplyDtoSupplyTypeEnum(this.value);

final String value;

@override
String toString() => value;
}


