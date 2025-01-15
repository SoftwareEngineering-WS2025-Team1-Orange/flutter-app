import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PowerSupplyApi
void main() {
  final instance = Openapi().getPowerSupplyApi();

  group(PowerSupplyApi, () {
    //Future addPowersupply(int donatorId, PowerSupplyRegisterDto powerSupplyRegisterDto) async
    test('test addPowersupply', () async {
      // TODO
    });

    //Future<List<PowerSupplyDto>> getPowersupply(int donatorId) async
    test('test getPowersupply', () async {
      // TODO
    });

  });
}
