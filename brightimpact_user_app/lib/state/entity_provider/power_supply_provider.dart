import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/power_supply.dart';
import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_provider_exception.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PowerSupplyProvider extends EntityProvider<List<PowerSupply>> {
  final int _donatorId;
  int get donatorId => _donatorId;

  PowerSupplyProvider({required donatorId}) : _donatorId = donatorId;

  @override
  Future<ApiResponse<List<PowerSupply>>> getFromServer(
      {required int id}) async {
    final api = ApiService.shared.api.getPowerSupplyApi();
    final response = await api.getPowersupply(donatorId: _donatorId);

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
        data: entity.map((e) => PowerSupply.fromDto(e)).toList());
  }

  Future<ApiProviderError?> registerPowerSupply(
      String name, String modelNumber, String apiConfig) async {
    final api = ApiService.shared.api.getPowerSupplyApi();
    final dto = PowerSupplyRegisterDto(
        name: name,
        modelNumber: modelNumber,
        apiConfig: apiConfig,
        type: PowerSupplyRegisterDtoTypeEnum.solar);
    try {
      final response = await api.addPowersupply(
          donatorId: _donatorId, powerSupplyRegisterDto: dto);

      if ((response.statusCode ?? 500) >= 300) {
        return ApiProviderError.unknownError;
      }

      // If successfull refetch donationbox objects
      refetch();

      // SUCCESS
      return null;
    } catch (e) {
      debugPrint("Error fetching entity: $e");

      // Return provider error. If error is unknown, return unkown error.
      if (e is ApiProviderException) {
        return e.errorType;
      } else if (e is DioException) {
        return e.type == DioExceptionType.connectionError ||
                e.type == DioExceptionType.connectionTimeout ||
                e.type == DioExceptionType.receiveTimeout
            ? ApiProviderError.connectionError
            : ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0);
      } else {
        return ApiProviderError.unknownError;
      }
    }
  }
}
