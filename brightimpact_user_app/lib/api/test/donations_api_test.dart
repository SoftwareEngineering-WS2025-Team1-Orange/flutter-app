import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonationsApi
void main() {
  final instance = Openapi().getDonationsApi();

  group(DonationsApi, () {
    //Future<GetDonationList200ResponseDto> getDonationList(int donatorId, { int filterId, int filterNgoId, String filterNgoName, int filterProjectId, String filterProjectName, DateTime filterCreatedFrom, DateTime filterCreatedTo, num filterAmountFrom, num filterAmountTo, String sortFor, SortTypeDto sortType, int paginationPage, int paginationPageSize }) async
    test('test getDonationList', () async {
      // TODO
    });

  });
}
