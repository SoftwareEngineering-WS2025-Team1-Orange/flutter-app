import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonatorApi
void main() {
  final instance = Openapi().getDonatorApi();

  group(DonatorApi, () {
    //Future<DonatorDto> donatorDonatorIdGet(int donatorId) async
    test('test donatorDonatorIdGet', () async {
      // TODO
    });

    //Future<DonatorDto> donatorMeGet() async
    test('test donatorMeGet', () async {
      // TODO
    });

    //Future<int> donatorPost(DonatorRegisterDto donatorRegisterDto) async
    test('test donatorPost', () async {
      // TODO
    });

  });
}
