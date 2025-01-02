//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'payout_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PayoutDto {
  /// Returns a new [PayoutDto] instance.
  PayoutDto({

    required  this.periodStart,

    required  this.periodEnd,
  });

  @JsonKey(
    
    name: r'periodStart',
    required: true,
    includeIfNull: false,
  )


  final DateTime periodStart;



  @JsonKey(
    
    name: r'periodEnd',
    required: true,
    includeIfNull: false,
  )


  final DateTime periodEnd;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PayoutDto &&
      other.periodStart == periodStart &&
      other.periodEnd == periodEnd;

    @override
    int get hashCode =>
        periodStart.hashCode +
        periodEnd.hashCode;

  factory PayoutDto.fromJson(Map<String, dynamic> json) => _$PayoutDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PayoutDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

