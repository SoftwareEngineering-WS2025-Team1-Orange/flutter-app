//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'response_token_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResponseTokenDto {
  /// Returns a new [ResponseTokenDto] instance.
  ResponseTokenDto({

    required  this.accessToken,

     this.tokenType,

     this.expiresIn,

     this.scope,
  });

  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false,
  )


  final String accessToken;



  @JsonKey(
    
    name: r'token_type',
    required: false,
    includeIfNull: false,
  )


  final String? tokenType;



  @JsonKey(
    
    name: r'expires_in',
    required: false,
    includeIfNull: false,
  )


  final int? expiresIn;



  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final String? scope;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ResponseTokenDto &&
      other.accessToken == accessToken &&
      other.tokenType == tokenType &&
      other.expiresIn == expiresIn &&
      other.scope == scope;

    @override
    int get hashCode =>
        accessToken.hashCode +
        tokenType.hashCode +
        expiresIn.hashCode +
        scope.hashCode;

  factory ResponseTokenDto.fromJson(Map<String, dynamic> json) => _$ResponseTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseTokenDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

