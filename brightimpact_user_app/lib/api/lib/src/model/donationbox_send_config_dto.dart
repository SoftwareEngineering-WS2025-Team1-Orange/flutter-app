//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/config_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'donationbox_send_config_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonationboxSendConfigDto {
  /// Returns a new [DonationboxSendConfigDto] instance.
  DonationboxSendConfigDto({

    required  this.pluginName,

    required  this.cuid,

    required  this.config,
  });

  @JsonKey(
    
    name: r'pluginName',
    required: true,
    includeIfNull: false,
  )


  final String pluginName;



  @JsonKey(
    
    name: r'cuid',
    required: true,
    includeIfNull: false,
  )


  final String cuid;



  @JsonKey(
    
    name: r'config',
    required: true,
    includeIfNull: false,
  )


  final ConfigDto config;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxSendConfigDto &&
      other.pluginName == pluginName &&
      other.cuid == cuid &&
      other.config == config;

    @override
    int get hashCode =>
        pluginName.hashCode +
        cuid.hashCode +
        config.hashCode;

  factory DonationboxSendConfigDto.fromJson(Map<String, dynamic> json) => _$DonationboxSendConfigDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxSendConfigDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

