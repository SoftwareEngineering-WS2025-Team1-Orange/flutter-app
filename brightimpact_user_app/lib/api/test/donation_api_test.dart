import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonationApi
void main() {
  final instance = Openapi().getDonationApi();

  group(DonationApi, () {
    //Future<DonateToNgo201ResponseDto> donateToNgo(int donatorId, int ngoId, DonateToNgoRequestDto donateToNgoRequestDto) async
    test('test donateToNgo', () async {
      // TODO
    });

    //Future<DonateToProject201ResponseDto> donateToProject(int donatorId, int projectId, DonateToProjectRequestDto donateToProjectRequestDto) async
    test('test donateToProject', () async {
      // TODO
    });

  });
}
