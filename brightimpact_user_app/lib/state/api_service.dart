import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/token.dart';
import 'package:dio/dio.dart';
/*import 'package:dio/dio.dart';

final Dio sharedDio = Dio(BaseOptions(
  baseUrl: "https://preview-mainframe.sokutan.de/api/v1",
  connectTimeout:
      Duration(milliseconds: 5000),
  receiveTimeout:
      Duration(milliseconds: 3000),
));*/

class ApiService {
  // Singelton
  static final shared = ApiService._();

  Token? _token;
  Token? get token => _token;

  late final Openapi api;


  ApiService._() {
    api = Openapi(
        basePathOverride: "https://preview-mainframe.sokutan.de/api/v1",
        interceptors: [InterceptorsWrapper(onRequest: _onRequest)]);
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) {
      options.headers["Authorization"] = "Bearer ${token!.accessToken}";
    }
    return handler.next(options);
  }


  void setToken(Token? token) {
    _token = token;
  }

}
