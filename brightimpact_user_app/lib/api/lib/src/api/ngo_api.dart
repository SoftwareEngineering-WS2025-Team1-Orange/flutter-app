//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openapi/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/model/get_ngo_list200_response_dto.dart';
import 'package:openapi/src/model/sort_type_dto.dart';

class NGOApi {

  final Dio _dio;

  const NGOApi(this._dio);

  /// getNgoList
  /// 
  ///
  /// Parameters:
  /// * [donatorId] 
  /// * [filterNgoId] 
  /// * [filterIsFavorite] 
  /// * [filterNameContains] 
  /// * [filterDonatedTo] 
  /// * [paginationPage] 
  /// * [paginationPageSize] 
  /// * [sortType] 
  /// * [sortFor] - The field to sort by
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetNgoList200ResponseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetNgoList200ResponseDto>> getNgoList({ 
    required int donatorId,
    int? filterNgoId,
    bool? filterIsFavorite,
    String? filterNameContains,
    bool? filterDonatedTo,
    int? paginationPage = 1,
    int? paginationPageSize = 20,
    SortTypeDto? sortType,
    String? sortFor,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api-donator/ngo'.replaceAll('{' r'donator_id' '}', donatorId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'oauth2',
            'name': 'OAuth2PasswordBearer',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (filterNgoId != null) r'filter_ngo_id': filterNgoId,
      if (filterIsFavorite != null) r'filter_is_favorite': filterIsFavorite,
      if (filterNameContains != null) r'filter_name_contains': filterNameContains,
      if (filterDonatedTo != null) r'filter_donated_to': filterDonatedTo,
      if (paginationPage != null) r'pagination_page': paginationPage,
      if (paginationPageSize != null) r'pagination_page_size': paginationPageSize,
      if (sortType != null) r'sort_type': sortType,
      if (sortFor != null) r'sort_for': sortFor,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetNgoList200ResponseDto? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetNgoList200ResponseDto, GetNgoList200ResponseDto>(rawData, 'GetNgoList200ResponseDto', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetNgoList200ResponseDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
