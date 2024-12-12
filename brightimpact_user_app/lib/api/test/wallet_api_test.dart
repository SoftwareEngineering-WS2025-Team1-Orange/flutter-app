import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for WalletApi
void main() {
  final instance = Openapi().getWalletApi();

  group(WalletApi, () {
    //Future<WalletDto> donatorDonatorIdWalletGet(int donatorId) async
    test('test donatorDonatorIdWalletGet', () async {
      // TODO
    });

  });
}
