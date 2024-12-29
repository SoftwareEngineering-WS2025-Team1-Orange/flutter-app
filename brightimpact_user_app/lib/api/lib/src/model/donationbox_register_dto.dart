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

    required  this.cuid,

     this.powerSupplyId,
  });

  @JsonKey(
    
    name: r'cuid',
    required: true,
    includeIfNull: false,
  )


  final String cuid;



  @JsonKey(
    
    name: r'power_supply_id',
    required: false,
    includeIfNull: false,
  )


  final String? powerSupplyId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxRegisterDto &&
      other.cuid == cuid &&
      other.powerSupplyId == powerSupplyId;

    @override
    int get hashCode =>
        cuid.hashCode +
        powerSupplyId.hashCode;

  factory DonationboxRegisterDto.fromJson(Map<String, dynamic> json) => _$DonationboxRegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxRegisterDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

