//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donate_to_project_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonateToProjectRequestDto {
  /// Returns a new [DonateToProjectRequestDto] instance.
  DonateToProjectRequestDto({

     this.amount,
  });

  @JsonKey(
    
    name: r'amount',
    required: false,
    includeIfNull: false,
  )


  final num? amount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonateToProjectRequestDto &&
      other.amount == amount;

    @override
    int get hashCode =>
        amount.hashCode;

  factory DonateToProjectRequestDto.fromJson(Map<String, dynamic> json) => _$DonateToProjectRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonateToProjectRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

