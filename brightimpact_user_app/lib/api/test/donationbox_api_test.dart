import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonationboxApi
void main() {
  final instance = Openapi().getDonationboxApi();

  group(DonationboxApi, () {
    //Future<List<DonationboxDto>> getDonationbox(int donatorId) async
    test('test getDonationbox', () async {
      // TODO
    });

    //Future registerDonationbox(int donatorId, DonationboxRegisterDto donationboxRegisterDto) async
    test('test registerDonationbox', () async {
      // TODO
    });

    //Future sendConfig(DonationboxSendConfigDto donationboxSendConfigDto) async
    test('test sendConfig', () async {
      // TODO
    });

    //Future sendStatusUpdateRequest(SendStatusUpdateRequestRequestDto sendStatusUpdateRequestRequestDto) async
    test('test sendStatusUpdateRequest', () async {
      // TODO
    });

  });
}
