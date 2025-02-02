//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'donate_to_ngo_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DonateToNgoRequestDto {
  /// Returns a new [DonateToNgoRequestDto] instance.
  DonateToNgoRequestDto({

     this.amountInCent,
  });

  @JsonKey(
    
    name: r'amountInCent',
    required: false,
    includeIfNull: false,
  )


  final int? amountInCent;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DonateToNgoRequestDto &&
      other.amountInCent == amountInCent;

    @override
    int get hashCode =>
        amountInCent.hashCode;

  factory DonateToNgoRequestDto.fromJson(Map<String, dynamic> json) => _$DonateToNgoRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DonateToNgoRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

