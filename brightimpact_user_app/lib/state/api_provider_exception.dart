import 'package:bright_impact/state/api_provider_error.dart';

class ApiProviderException implements Exception {
  final ApiProviderError errorType;
  final String debugMessage;

  ApiProviderException(this.errorType, this.debugMessage);

  @override
  String toString() {
    return "ApiProviderException: ${errorType.message}, Debug Info: $debugMessage";
  }
}