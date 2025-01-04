import 'package:bright_impact/model/donator.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';


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

}