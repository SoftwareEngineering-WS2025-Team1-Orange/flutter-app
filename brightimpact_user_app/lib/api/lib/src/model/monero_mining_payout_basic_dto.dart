//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'monero_mining_payout_basic_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MoneroMiningPayoutBasicDto {
  /// Returns a new [MoneroMiningPayoutBasicDto] instance.
  MoneroMiningPayoutBasicDto({

    required  this.timestamp,

    required  this.periodStart,
  });

  @JsonKey(
    
    name: r'timestamp',
    required: true,
    includeIfNull: false,
  )


  final DateTime timestamp;



  @JsonKey(
    
    name: r'periodStart',
    required: true,
    includeIfNull: false,
  )


  final DateTime periodStart;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoneroMiningPayoutBasicDto &&
      other.timestamp == timestamp &&
      other.periodStart == periodStart;

    @override
    int get hashCode =>
        timestamp.hashCode +
        periodStart.hashCode;

  factory MoneroMiningPayoutBasicDto.fromJson(Map<String, dynamic> json) => _$MoneroMiningPayoutBasicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MoneroMiningPayoutBasicDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

