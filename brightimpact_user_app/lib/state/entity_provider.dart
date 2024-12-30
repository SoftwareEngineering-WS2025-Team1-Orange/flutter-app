import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_provider_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiResponse<T> {
  int? httpStatusCode;
  String? httpStatusMessage;
  T? data;

  ApiResponse({this.httpStatusCode, this.httpStatusMessage, this.data});
}

abstract class EntityProvider<T> extends ChangeNotifier{
  // PRIVATE ATTRIBUTES
  bool _isLoading = false;
  ApiProviderError? _loadingError;
  T? _entity;
  int? _id;

  // PUBLIC GETTER FOR PRIVATE ATTRIBUTES
  bool get isLoading => _isLoading;
  ApiProviderError? get loadingError => _loadingError;
  T? get entity => _entity;
  int? get id => _id;

  /// Override to fetch entity from server
  Future<ApiResponse<T>> getFromServer({required int id});

  Future<void> setIdAndFetch(int id) async {
    this._id = id;
    await _fetch();
  }

  Future<void> refetch() async {
    await _fetch();
  }

  Future<void> _fetch() async {
    if (id == null) { return; }

    _isLoading = true;
    _loadingError = null;

    try {
      final response = await getFromServer(id: id!);

      if (ApiProviderError.fromHttpCode(response.httpStatusCode) != null) {
        throw ApiProviderException(
            ApiProviderError.fromHttpCode(response.httpStatusCode)!,
            "Failed to load entity: HTTP Code ${response.httpStatusCode}");
      }

      if (response.data == null) {
        throw ApiProviderException(
            ApiProviderError.unknownError, "Missing entity response data");
      }

      _entity = response.data;


    } catch (e) {
      // Set provider error. If error is unknown, return unkown error.
      if (e is ApiProviderException) {
        _loadingError = e.errorType;
      } else if (e is DioException) {
        _loadingError =
        e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout
        ? ApiProviderError.connectionError
        : ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0);
      } else {
        _loadingError = ApiProviderError.unknownError;
      }
      
      print("Error fetching entity: $e");

    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
