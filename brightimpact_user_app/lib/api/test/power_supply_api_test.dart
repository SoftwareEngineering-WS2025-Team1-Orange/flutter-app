import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PowerSupplyApi
void main() {
  final instance = Openapi().getPowerSupplyApi();

  group(PowerSupplyApi, () {
    //Future<List<PowerSupplyDto>> donatorDonatorIdPowersupplyGet(int donatorId) async
    test('test donatorDonatorIdPowersupplyGet', () async {
      // TODO
    });

    //Future donatorDonatorIdPowersupplyPost(int donatorId, PowerSupplyRegisterDto powerSupplyRegisterDto) async
    test('test donatorDonatorIdPowersupplyPost', () async {
      // TODO
    });

  });
}
