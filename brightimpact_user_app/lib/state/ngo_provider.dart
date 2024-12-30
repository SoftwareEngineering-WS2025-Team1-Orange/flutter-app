import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider.dart';


class NgoProvider extends EntityProvider<NGO> {
  @override
  Future<ApiResponse<NGO>> getFromServer({required int id}) async {
    final response = await ApiService.shared.getNGOApi().getNgoList(donatorId: 1, filterNgoId: id);

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
        data: null
      );
    }

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: NGO.fromDto(list.first));
  }

  // For test
  void toggleFavorite() {
    
  }

}