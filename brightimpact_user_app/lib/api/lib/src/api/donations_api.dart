//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:openapi/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/model/get_donation_list200_response_dto.dart';
import 'package:openapi/src/model/sort_type_dto.dart';

class DonationsApi {

  final Dio _dio;

  const DonationsApi(this._dio);

  /// getDonationList
  /// 
  ///
  /// Parameters:
  /// * [donatorId] 
  /// * [filterId] 
  /// * [filterNgoId] 
  /// * [filterNgoName] 
  /// * [filterProjectId] 
  /// * [filterProjectName] 
  /// * [filterCreatedFrom] 
  /// * [filterCreatedTo] 
  /// * [filterAmountFrom] 
  /// * [filterAmountTo] 
  /// * [sortFor] - The field to sort by
  /// * [sortType] 
  /// * [paginationPage] 
  /// * [paginationPageSize] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDonationList200ResponseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDonationList200ResponseDto>> getDonationList({ 
    required int donatorId,
    int? filterId,
    int? filterNgoId,
    String? filterNgoName,
    int? filterProjectId,
    String? filterProjectName,
    DateTime? filterCreatedFrom,
    DateTime? filterCreatedTo,
    num? filterAmountFrom,
    num? filterAmountTo,
    String? sortFor,
    SortTypeDto? sortType,
    int? paginationPage = 1,
    int? paginationPageSize = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/donator/{donator_id}/donation'.replaceAll('{' r'donator_id' '}', donatorId.toString());
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
      if (filterId != null) r'filter_id': filterId,
      if (filterNgoId != null) r'filter_ngo_id': filterNgoId,
      if (filterNgoName != null) r'filter_ngo_name': filterNgoName,
      if (filterProjectId != null) r'filter_project_id': filterProjectId,
      if (filterProjectName != null) r'filter_project_name': filterProjectName,
      if (filterCreatedFrom != null) r'filter_created_from': filterCreatedFrom,
      if (filterCreatedTo != null) r'filter_created_to': filterCreatedTo,
      if (filterAmountFrom != null) r'filter_amount_from': filterAmountFrom,
      if (filterAmountTo != null) r'filter_amount_to': filterAmountTo,
      if (sortFor != null) r'sort_for': sortFor,
      if (sortType != null) r'sort_type': sortType,
      if (paginationPage != null) r'pagination_page': paginationPage,
      if (paginationPageSize != null) r'pagination_page_size': paginationPageSize,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetDonationList200ResponseDto? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDonationList200ResponseDto, GetDonationList200ResponseDto>(rawData, 'GetDonationList200ResponseDto', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDonationList200ResponseDto>(
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
