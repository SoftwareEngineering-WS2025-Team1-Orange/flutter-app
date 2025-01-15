import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonationsApi
void main() {
  final instance = Openapi().getDonationsApi();

  group(DonationsApi, () {
    //Future<GetTransactionList200ResponseDto> getTransactionList(int donatorId, { bool forceEarningsUpdate, int filterDonationNgoId, String filterDonationNgoName, int filterDonationProjectId, String filterDonationProjectName, int filterEarningDonationboxId, DateTime filterCreatedFrom, DateTime filterCreatedTo, num filterAmountFrom, num filterAmountTo, String sortFor, SortTypeDto sortType, int paginationPage, int paginationPageSize }) async
    test('test getTransactionList', () async {
      // TODO
    });

  });
}
