import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/donationbox.dart';
import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_provider_exception.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DonationboxProvider extends EntityProvider<List<Donationbox>> {
  final int _donatorId;
  int get donatorId => _donatorId;

  DonationboxProvider({required donatorId}) : _donatorId = donatorId;

  @override
  Future<ApiResponse<List<Donationbox>>> getFromServer(
      {required int id}) async {
    final api = ApiService.shared.api.getDonationboxApi();
    final response = await api.getDonationbox(donatorId: _donatorId);

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
        data: entity.map((e) => Donationbox.fromDto(e)).toList());
  }

  Future<ApiProviderError?> registerDonationBox(
      String cuid, String name) async {
    final api = ApiService.shared.api.getDonationboxApi();
    final dto = DonationboxRegisterDto(cuid: "cuid", name: "name");
    try {
      final response = await api.registerDonationbox(
          donatorId: _donatorId, donationboxRegisterDto: dto);

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

  static bool isValidSN(String uuid) {
    // Regex zum Überprüfen eines UUID-Formats
    final uuidRegex = RegExp(
      r'^[A-Za-z0-9]{24}$',
    );
    return uuidRegex.hasMatch(uuid);
  }
}
