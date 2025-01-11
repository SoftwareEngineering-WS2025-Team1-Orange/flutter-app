import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';

class NgoProvider extends EntityProvider<NGO> {
  final int _donatorId;
  int get donatorId => _donatorId;

  NgoProvider({required donatorId}) : _donatorId = donatorId;

  @override
  Future<ApiResponse<NGO>> getFromServer({required int id}) async {
    final response = await ApiService.shared.api
        .getNGOApi()
        .getNgoList(donatorId: _donatorId, filterNgoId: id);

    if (response.data == null) {
      return ApiResponse(
          httpStatusCode: response.statusCode,
          httpStatusMessage: response.statusMessage,
          data: null);
    }

    final list = response.data!.ngos;

    if (list.isEmpty) {
      return ApiResponse(
          httpStatusCode: 404,
          httpStatusMessage: "Entity with id ... was not found",
          data: null);
    }

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: NGO.fromDto(list.first));
  }

  /// Returns true if successfull, otherwiese false.
  Future<bool> setFavorite(bool isFavorite) async {
    if (id != null) {
      final response = await ApiService.shared.api.getDonatorApi().favoriteNgo(
          ngoId: id!,
          donatorId: donatorId,
          favoriteProjectRequestDto:
              FavoriteProjectRequestDto(favorite: isFavorite));

      if (response.data != null &&
          (response.statusCode ?? 500) >= 200 &&
          (response.statusCode ?? 500) < 300) {
        // If successfull, directly update entity with returned data
        updateEntitiy(NGO.fromDto(response.data!));
        return true;
      } else {
        return false;
      }
    } else {
      return Future.value(false);
    }
  }
}
