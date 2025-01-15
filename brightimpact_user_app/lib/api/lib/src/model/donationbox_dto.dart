//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/last_solar_data_dto.dart';
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

    required  this.name,

    required  this.cuid,

     this.lastSolarData,

     this.solarDataLastSuccessfulUpdateAt,

     this.averageWorkingTimePerDayInSeconds,

     this.averageWorkingTimePerDayInSecondsLastUpdateAt,

     this.averageIncomePerDayInCent,

     this.averageIncomePerDayLastUpdateAt,

    required  this.status,

    required  this.solarStatus,

     this.earningsLastSuccessfulUpdateAt,

    required  this.earningsLastUpdateSuccessful,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'cuid',
    required: true,
    includeIfNull: false,
  )


  final String cuid;



  @JsonKey(
    
    name: r'lastSolarData',
    required: false,
    includeIfNull: false,
  )


  final LastSolarDataDto? lastSolarData;



  @JsonKey(
    
    name: r'solarDataLastSuccessfulUpdateAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? solarDataLastSuccessfulUpdateAt;



  @JsonKey(
    
    name: r'averageWorkingTimePerDayInSeconds',
    required: false,
    includeIfNull: false,
  )


  final num? averageWorkingTimePerDayInSeconds;



  @JsonKey(
    
    name: r'averageWorkingTimePerDayInSecondsLastUpdateAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? averageWorkingTimePerDayInSecondsLastUpdateAt;



  @JsonKey(
    
    name: r'averageIncomePerDayInCent',
    required: false,
    includeIfNull: false,
  )


  final num? averageIncomePerDayInCent;



  @JsonKey(
    
    name: r'averageIncomePerDayLastUpdateAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? averageIncomePerDayLastUpdateAt;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final DonationboxDtoStatusEnum status;



  @JsonKey(
    
    name: r'solarStatus',
    required: true,
    includeIfNull: false,
  )


  final DonationboxDtoSolarStatusEnum solarStatus;



  @JsonKey(
    
    name: r'earningsLastSuccessfulUpdateAt',
    required: false,
    includeIfNull: false,
  )


  final DateTime? earningsLastSuccessfulUpdateAt;



  @JsonKey(
    
    name: r'earningsLastUpdateSuccessful',
    required: true,
    includeIfNull: false,
  )


  final bool earningsLastUpdateSuccessful;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonationboxDto &&
      other.id == id &&
      other.name == name &&
      other.cuid == cuid &&
      other.lastSolarData == lastSolarData &&
      other.solarDataLastSuccessfulUpdateAt == solarDataLastSuccessfulUpdateAt &&
      other.averageWorkingTimePerDayInSeconds == averageWorkingTimePerDayInSeconds &&
      other.averageWorkingTimePerDayInSecondsLastUpdateAt == averageWorkingTimePerDayInSecondsLastUpdateAt &&
      other.averageIncomePerDayInCent == averageIncomePerDayInCent &&
      other.averageIncomePerDayLastUpdateAt == averageIncomePerDayLastUpdateAt &&
      other.status == status &&
      other.solarStatus == solarStatus &&
      other.earningsLastSuccessfulUpdateAt == earningsLastSuccessfulUpdateAt &&
      other.earningsLastUpdateSuccessful == earningsLastUpdateSuccessful;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        cuid.hashCode +
        lastSolarData.hashCode +
        solarDataLastSuccessfulUpdateAt.hashCode +
        averageWorkingTimePerDayInSeconds.hashCode +
        averageWorkingTimePerDayInSecondsLastUpdateAt.hashCode +
        averageIncomePerDayInCent.hashCode +
        averageIncomePerDayLastUpdateAt.hashCode +
        status.hashCode +
        solarStatus.hashCode +
        earningsLastSuccessfulUpdateAt.hashCode +
        earningsLastUpdateSuccessful.hashCode;

  factory DonationboxDto.fromJson(Map<String, dynamic> json) => _$DonationboxDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonationboxDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum DonationboxDtoStatusEnum {
@JsonValue(r'Connected')
connected(r'Connected'),
@JsonValue(r'Disconnected')
disconnected(r'Disconnected'),
@JsonValue(r'Working')
working(r'Working'),
@JsonValue(r'Uninitialized')
uninitialized(r'Uninitialized'),
@JsonValue(r'Unknown_Status_Code')
unknownStatusCode(r'Unknown_Status_Code');

const DonationboxDtoStatusEnum(this.value);

final String value;

@override
String toString() => value;
}



enum DonationboxDtoSolarStatusEnum {
@JsonValue(r'Ok')
ok(r'Ok'),
@JsonValue(r'Error')
error(r'Error'),
@JsonValue(r'Pending')
pending(r'Pending'),
@JsonValue(r'Uninitialized')
uninitialized(r'Uninitialized');

const DonationboxDtoSolarStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


