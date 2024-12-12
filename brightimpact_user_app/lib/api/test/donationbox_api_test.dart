import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonationboxApi
void main() {
  final instance = Openapi().getDonationboxApi();

  group(DonationboxApi, () {
    //Future<List<DonationboxDto>> donatorDonatorIdDonationboxGet(int donatorId) async
    test('test donatorDonatorIdDonationboxGet', () async {
      // TODO
    });

    //Future donatorDonatorIdDonationboxPost(int donatorId, DonationboxRegisterDto donationboxRegisterDto) async
    test('test donatorDonatorIdDonationboxPost', () async {
      // TODO
    });

  });
}
