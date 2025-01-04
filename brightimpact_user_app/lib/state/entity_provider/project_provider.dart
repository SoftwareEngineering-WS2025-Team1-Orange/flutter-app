import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';



class ProjectProvider extends EntityProvider<Project> {
  final int _donatorId;
  int get donatorId => _donatorId;

  ProjectProvider({required donatorId}): _donatorId = donatorId;

  @override
  Future<ApiResponse<Project>> getFromServer({required int id}) async {
    final response = await ApiService.shared.api.getProjectApi().getProjectList(donatorId: 1, filterProjectId: id);

    if (response.data == null) {
      return ApiResponse(
          httpStatusCode: response.statusCode,
          httpStatusMessage: response.statusMessage,
          data: null);
    }

    final list = response.data!.projects;

    if (list.isEmpty) {
      return ApiResponse(
        httpStatusCode: 404,
        httpStatusMessage: "Entity with id ... was not found",
        data: null
      );
    }

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: Project.fromDto(list.first));
  }

  // For test
  void toggleFavorite() {
    
  }

}