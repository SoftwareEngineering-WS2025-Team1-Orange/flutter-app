import 'package:bright_impact/model/donationbox.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';


class DonationboxProvider extends EntityProvider<List<Donationbox>> {
  final int _donatorId;
  int get donatorId => _donatorId;

  DonationboxProvider({required donatorId}) : _donatorId = donatorId;

  @override
  Future<ApiResponse<List<Donationbox>>> getFromServer({required int id}) async {
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

}