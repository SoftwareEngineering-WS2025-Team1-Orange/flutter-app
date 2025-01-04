import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/token.dart';
import 'package:bright_impact/state/api_service.dart';

class ApiLogin {
  Future<Token?> login(String email, String password) async {
    try {
      RequestTokenDto credentials = RequestTokenDto(
          username: email,
          password: password,
          clientId: "postman",
          clientSecret: "1234", // TODO: adjust
          grantType: "password");
      final responseToken = await ApiService.shared.api
          .getAuthApi()
          .getToken(requestTokenDto: credentials);

      if (responseToken.data == null) {
        throw Exception("Response Token data is null");
      }

      // SUCCESS
      return Future.value(Token(responseToken.data!.accessToken));

    } catch (e) {
      print("Login Error: $e");
      return Future.value(null);
    }
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
      await ApiService.shared.api
          .getDonatorApi()
          .registerDonator(donatorRegisterDto: data);

      return Future.value(true);
    } catch (e) {
      print("Register Error: $e");
      return Future.value(false);
    }
  }
}
