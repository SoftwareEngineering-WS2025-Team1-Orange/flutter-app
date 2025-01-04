import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonatorApi
void main() {
  final instance = Openapi().getDonatorApi();

  group(DonatorApi, () {
    //Future<DonatorDto> getDonator(int donatorId) async
    test('test getDonator', () async {
      // TODO
    });

    //Future<DonatorDto> getDonatorByToken() async
    test('test getDonatorByToken', () async {
      // TODO
    });

    //Future<DonatorDto> registerDonator(DonatorRegisterDto donatorRegisterDto) async
    test('test registerDonator', () async {
      // TODO
    });

  });
}
