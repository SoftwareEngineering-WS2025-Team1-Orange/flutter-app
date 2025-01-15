//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'send_status_update_request_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendStatusUpdateRequestRequestDto {
  /// Returns a new [SendStatusUpdateRequestRequestDto] instance.
  SendStatusUpdateRequestRequestDto({

     this.cuid,
  });

  @JsonKey(
    
    name: r'cuid',
    required: false,
    includeIfNull: false,
  )


  final String? cuid;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SendStatusUpdateRequestRequestDto &&
      other.cuid == cuid;

    @override
    int get hashCode =>
        cuid.hashCode;

  factory SendStatusUpdateRequestRequestDto.fromJson(Map<String, dynamic> json) => _$SendStatusUpdateRequestRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SendStatusUpdateRequestRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

