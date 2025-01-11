import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/donator.dart';
import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_provider_exception.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class DonatorProvider extends EntityProvider<Donator> {
  @override
  Future<ApiResponse<Donator>> getFromServer({required int id}) async {
    final api = ApiService.shared.api.getDonatorApi();
    final response = id <= 0 ? await api.getDonatorByToken() : await api.getDonator(donatorId: id); 

    if (response.data == null) {
      return ApiResponse(
          httpStatusCode: response.statusCode,
          httpStatusMessage: response.statusMessage,
          data: null);
    }

    final entity = response.data!;

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: Donator.fromDto(entity));
  }

 Future<ApiProviderError?> donateTo(bool isNgo, int targetEntityId, double amount) async {
  if (id != null) {
    try {
    final api = ApiService.shared.api.getDonationApi();
    final ngoAmount = DonateToNgoRequestDto(amount: amount);
    final projectAmount = DonateToProjectRequestDto(amount: amount);
    final response = isNgo ? (await api.donateToNgo(donatorId: id!, ngoId: targetEntityId, donateToNgoRequestDto: ngoAmount)).statusCode : (await api.donateToProject(donatorId: id!, projectId: targetEntityId, donateToProjectRequestDto: projectAmount)).statusCode;

    if ((response ?? 500) >= 300) {
      return ApiProviderError.unknownError;
    }

    // If successfull refetch latest donator object
    refetch();

    return null;


    } catch (e) {
      debugPrint("Error fetching entity: $e");

      // Return provider error. If error is unknown, return unkown error.
      if (e is ApiProviderException) {
        return e.errorType;
      } else if (e is DioException) {
        return
        e.type == DioExceptionType.connectionError || e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout
        ? ApiProviderError.connectionError
        : ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0);
      } else {
        return ApiProviderError.unknownError;
      }
    }

  } else {
    return Future.value(ApiProviderError.internalServerError);
  }
  
 }

}