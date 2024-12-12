import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TokenApi
void main() {
  final instance = Openapi().getTokenApi();

  group(TokenApi, () {
    //Future<ResponseTokenDto> tokenPost(String username, String password, { String grantType, String scope, String clientId, String clientSecret }) async
    test('test tokenPost', () async {
      // TODO
    });

  });
}
