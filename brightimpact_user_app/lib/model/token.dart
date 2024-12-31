import 'package:bright_impact/api/lib/openapi.dart';

class Token {
  final String accessToken;

  Token(this.accessToken);

  Token.fromDto(ResponseTokenDto dto)
      : accessToken = dto.accessToken;

  // Serialisieren in JSON
  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };

  // Von JSON deserialisieren
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      json["access_token"]
    );
  }
}
