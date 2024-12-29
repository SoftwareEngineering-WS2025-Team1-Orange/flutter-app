enum ApiProviderError {
  connectionError("Keine Internetverbindung."),
  notFound("Daten konnten nicht gefunden werden."),
  authError("Du bist nicht angemeldet."),
  permissionError("Da darfst du nicht drauf zugreifen."),
  internalServerError("Unser Server macht gerade Faxen."),

  unknownError("Da ist bei uns was schief gelaufen.");


  // message for displaying to user
  final String message;

  const ApiProviderError(this.message);

  static ApiProviderError? fromHttpCode(int? httpResponseCode) {
    switch (httpResponseCode ?? -1) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
        return null;

      case 401:
        return ApiProviderError.authError;

      case 403:
        return ApiProviderError.permissionError;

      case 404:
        return ApiProviderError.notFound;

      case 500:
        return ApiProviderError.internalServerError;

      default:
        return ApiProviderError.unknownError;
    }
  }
}
