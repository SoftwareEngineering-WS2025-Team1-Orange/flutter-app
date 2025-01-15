import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DonatorApi
void main() {
  final instance = Openapi().getDonatorApi();

  group(DonatorApi, () {
    //Future deleteDonator(int donatorId) async
    test('test deleteDonator', () async {
      // TODO
    });

    //Future<NGODto> favoriteNgo(int ngoId, int donatorId, FavoriteProjectRequestDto favoriteProjectRequestDto) async
    test('test favoriteNgo', () async {
      // TODO
    });

    //Future<ProjectDto> favoriteProject(int projectId, int donatorId, FavoriteProjectRequestDto favoriteProjectRequestDto) async
    test('test favoriteProject', () async {
      // TODO
    });

    //Future<DonatorDto> getDonator(int donatorId, { bool forceEarningsUpdate }) async
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

    //Future<DonatorDto> updateDonator(int donatorId, DonatorUpdateDto donatorUpdateDto) async
    test('test updateDonator', () async {
      // TODO
    });

  });
}
