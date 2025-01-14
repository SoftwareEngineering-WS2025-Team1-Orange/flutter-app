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

    required  this.lastPayoutTimestamp,
  });

  @JsonKey(
    
    name: r'timestamp',
    required: true,
    includeIfNull: false,
  )


  final DateTime timestamp;



  @JsonKey(
    
    name: r'lastPayoutTimestamp',
    required: true,
    includeIfNull: false,
  )


  final DateTime lastPayoutTimestamp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MoneroMiningPayoutBasicDto &&
      other.timestamp == timestamp &&
      other.lastPayoutTimestamp == lastPayoutTimestamp;

    @override
    int get hashCode =>
        timestamp.hashCode +
        lastPayoutTimestamp.hashCode;

  factory MoneroMiningPayoutBasicDto.fromJson(Map<String, dynamic> json) => _$MoneroMiningPayoutBasicDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MoneroMiningPayoutBasicDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

