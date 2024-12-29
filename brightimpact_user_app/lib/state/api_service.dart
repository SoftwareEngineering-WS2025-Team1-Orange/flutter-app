import 'package:bright_impact/api/lib/openapi.dart';
/*import 'package:dio/dio.dart';

final Dio sharedDio = Dio(BaseOptions(
  baseUrl: "https://preview-mainframe.sokutan.de/api/v1",
  connectTimeout:
      Duration(milliseconds: 5000),
  receiveTimeout:
      Duration(milliseconds: 3000),
));*/

class ApiService {
  // Singleton
  static final shared = Openapi(basePathOverride: "https://preview-mainframe.sokutan.de/api/v1");



}