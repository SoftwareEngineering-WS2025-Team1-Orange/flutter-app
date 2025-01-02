import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ProjectApi
void main() {
  final instance = Openapi().getProjectApi();

  group(ProjectApi, () {
    //Future<GetProjectList200ResponseDto> getProjectList(int donatorId, { int filterProjectId, ProjectCategoryDto filterCategory, bool filterIsFavorite, String filterNameContains, bool filterDonatedTo, int paginationPage, int paginationPageSize, int filterNgoId, String filterNgoNameContains, String sortFor, SortTypeDto sortType }) async
    test('test getProjectList', () async {
      // TODO
    });

  });
}
