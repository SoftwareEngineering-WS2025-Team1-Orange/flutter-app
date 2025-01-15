//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'request_token_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RequestTokenDto {
  /// Returns a new [RequestTokenDto] instance.
  RequestTokenDto({

    required  this.grantType,

     this.username,

     this.password,

     this.scope,

    required  this.clientId,

    required  this.clientSecret,
  });

  @JsonKey(
    
    name: r'grant_type',
    required: true,
    includeIfNull: false,
  )


  final String grantType;



  @JsonKey(
    
    name: r'username',
    required: false,
    includeIfNull: false,
  )


  final String? username;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;



  @JsonKey(
    
    name: r'scope',
    required: false,
    includeIfNull: false,
  )


  final List<RequestTokenDtoScopeEnum>? scope;



  @JsonKey(
    
    name: r'client_id',
    required: true,
    includeIfNull: true,
  )


  final String? clientId;



  @JsonKey(
    
    name: r'client_secret',
    required: true,
    includeIfNull: true,
  )


  final String? clientSecret;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RequestTokenDto &&
      other.grantType == grantType &&
      other.username == username &&
      other.password == password &&
      other.scope == scope &&
      other.clientId == clientId &&
      other.clientSecret == clientSecret;

    @override
    int get hashCode =>
        grantType.hashCode +
        username.hashCode +
        password.hashCode +
        scope.hashCode +
        (clientId == null ? 0 : clientId.hashCode) +
        (clientSecret == null ? 0 : clientSecret.hashCode);

  factory RequestTokenDto.fromJson(Map<String, dynamic> json) => _$RequestTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


enum RequestTokenDtoScopeEnum {
@JsonValue(r'READ_DONATION')
READ_DONATION(r'READ_DONATION'),
@JsonValue(r'WRITE_DONATION')
WRITE_DONATION(r'WRITE_DONATION'),
@JsonValue(r'READ_DONATIONBOX')
READ_DONATIONBOX(r'READ_DONATIONBOX'),
@JsonValue(r'WRITE_DONATIONBOX')
WRITE_DONATIONBOX(r'WRITE_DONATIONBOX'),
@JsonValue(r'READ_DONATOR')
READ_DONATOR(r'READ_DONATOR'),
@JsonValue(r'WRITE_DONATOR')
WRITE_DONATOR(r'WRITE_DONATOR'),
@JsonValue(r'READ_NGO')
READ_NGO(r'READ_NGO'),
@JsonValue(r'READ_PROJECT')
READ_PROJECT(r'READ_PROJECT'),
@JsonValue(r'READ_TRANSACTION')
READ_TRANSACTION(r'READ_TRANSACTION');

const RequestTokenDtoScopeEnum(this.value);

final String value;

@override
String toString() => value;
}


