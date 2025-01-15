import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for NGOApi
void main() {
  final instance = Openapi().getNGOApi();

  group(NGOApi, () {
    //Future<GetNgoList200ResponseDto> getNgoList(int donatorId, { int filterNgoId, bool filterIsFavorite, String filterNameContains, bool filterDonatedTo, int paginationPage, int paginationPageSize, SortTypeDto sortType, String sortFor }) async
    test('test getNgoList', () async {
      // TODO
    });

  });
}
