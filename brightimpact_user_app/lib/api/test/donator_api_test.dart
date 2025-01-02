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

    //Future<Login200ResponseDto> login(DonatorLoginDto donatorLoginDto) async
    test('test login', () async {
      // TODO
    });

    //Future<int> registerDonator(DonatorRegisterDto donatorRegisterDto) async
    test('test registerDonator', () async {
      // TODO
    });

  });
}
