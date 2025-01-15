import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<ResponseTokenDto> getToken(RequestTokenDto requestTokenDto) async
    test('test getToken', () async {
      // TODO
    });

    //Future logout() async
    test('test logout', () async {
      // TODO
    });

  });
}
