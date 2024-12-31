import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a donator (user of the app). Class Donator should be to deal with donator data in the UI.
class Donator {
  final String firstname;
  final String lastname;
  final String email;
  final num balance;
  final int id;

  Donator(this.firstname, this.lastname, this.balance, this.id, this.email);

  Donator.fromDto(DonatorDto dto)
      : firstname = dto.firstName,
        lastname = dto.lastName,
        id = dto.id,
        balance = dto.balance,
        email = dto.email;

  // Serialisieren in JSON
  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "balance": balance,
        "id": id,
      };

  // Von JSON deserialisieren
  factory Donator.fromJson(Map<String, dynamic> json) {
    return Donator(
      json["firstname"],
      json["lastname"],
      json["balance"],
      json["id"],
      json["email"],
    );
  }
}
