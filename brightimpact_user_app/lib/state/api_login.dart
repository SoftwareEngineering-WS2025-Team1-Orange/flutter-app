import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/token.dart';
import 'package:bright_impact/state/api_service.dart';

class ApiLogin {
  Future<Token?> login(String email, String password) async {
    try {
      DonatorLoginDto credentials =
          DonatorLoginDto(mail: email, password: password);
      await ApiService.shared
          .getDonatorApi()
          .login(donatorLoginDto: credentials);
    } catch (e) {
      print("Login Error: $e");
    } finally {}
    return Future.value(Token("MEIN_TOKEN"));
  }

  Future<bool> register(
      {required String firstname,
      required String lastname,
      required String email,
      required String password}) async {
    try {
      DonatorRegisterDto data = DonatorRegisterDto(
          firstName: firstname,
          lastName: lastname,
          password: password,
          email: email);
      await ApiService.shared
          .getDonatorApi()
          .registerDonator(donatorRegisterDto: data);

      return Future.value(true);
    } catch (e) {
      print("Register Error: $e");
      return Future.value(false);
    }
  }
}
