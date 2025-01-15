import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:flutter/material.dart';

class ProjectProvider extends EntityProvider<Project> {
  final int _donatorId;
  int get donatorId => _donatorId;

  ProjectProvider({required donatorId}) : _donatorId = donatorId;

  @override
  Future<ApiResponse<Project>> getFromServer({required int id}) async {
    final response = await ApiService.shared.api
        .getProjectApi()
        .getProjectList(donatorId: _donatorId, filterProjectId: id);

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
          data: null);
    }

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: Project.fromDto(list.first));
  }

  /// Returns true if successfull, otherwiese false.
  Future<bool> setFavorite(bool isFavorite) async {
    if (id != null) {
      try {
        final response = await ApiService.shared.api
            .getDonatorApi()
            .favoriteProject(
                projectId: id!,
                donatorId: donatorId,
                favoriteProjectRequestDto:
                    FavoriteProjectRequestDto(favorite: isFavorite));

        if (response.data != null &&
            (response.statusCode ?? 500) >= 200 &&
            (response.statusCode ?? 500) < 300) {
          // If successfull, directly update entity with returned data
          updateEntitiy(Project.fromDto(response.data!));
          return true;
        } else {
          return false;
        }
      } catch (e) {
        debugPrint("Error on setting favorite: $e");
        return false;
      }
    } else {
      return Future.value(false);
    }
  }
}