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

     this.amountInCent,
  });

  @JsonKey(
    
    name: r'amountInCent',
    required: false,
    includeIfNull: false,
  )


  final int? amountInCent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonateToProjectRequestDto &&
      other.amountInCent == amountInCent;

    @override
    int get hashCode =>
        amountInCent.hashCode;

  factory DonateToProjectRequestDto.fromJson(Map<String, dynamic> json) => _$DonateToProjectRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonateToProjectRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

