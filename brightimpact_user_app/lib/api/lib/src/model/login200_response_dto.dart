//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/response_token_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login200_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Login200ResponseDto {
  /// Returns a new [Login200ResponseDto] instance.
  Login200ResponseDto({

     this.donatorId,

     this.accessToken,
  });

  @JsonKey(
    
    name: r'donator_id',
    required: false,
    includeIfNull: false,
  )


  final int? donatorId;



  @JsonKey(
    
    name: r'access_token',
    required: false,
    includeIfNull: false,
  )


  final ResponseTokenDto? accessToken;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Login200ResponseDto &&
      other.donatorId == donatorId &&
      other.accessToken == accessToken;

    @override
    int get hashCode =>
        donatorId.hashCode +
        accessToken.hashCode;

  factory Login200ResponseDto.fromJson(Map<String, dynamic> json) => _$Login200ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$Login200ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

