import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/token.dart';
import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:dio/dio.dart';

class ApiLogin {
  Future<(Token?,ApiProviderError?)> login(String email, String password) async {
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
      return Future.value((Token(responseToken.data!.accessToken), null));

    } catch (e) {
      print("Login Error: $e");

      if (e is DioException) {
        // Special case: wrong credentials
        if (e.response?.statusCode == 403) {
          return (null, ApiProviderError.wrongCredentials);
        }

        // All other errors
        return Future.value(e.type == DioExceptionType.connectionError ||
                e.type == DioExceptionType.connectionTimeout ||
                e.type == DioExceptionType.receiveTimeout
            ? (null, ApiProviderError.connectionError)
            : (null, ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0)));
      } else {
        return Future.value((null, ApiProviderError.unknownError));
      }
    }
  }

  

  Future<ApiProviderError?> register(
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

      // SUCCESS
      return Future.value(null);


    } catch (e) {
      print("Register Error: $e");

      if (e is DioException) {
        return Future.value(e.type == DioExceptionType.connectionError ||
                e.type == DioExceptionType.connectionTimeout ||
                e.type == DioExceptionType.receiveTimeout
            ? ApiProviderError.connectionError
            : ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0));
      } else {
        return Future.value(ApiProviderError.unknownError);
      }
    }
  }
}
