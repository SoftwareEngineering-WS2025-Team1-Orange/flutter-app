import 'package:bright_impact/model/project.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:dio/dio.dart';


class ProjectListProvider extends ListProvider<Project> {
  // PRIVATE ATTRIBUTES
  String? _filterNameContains;
  bool _filterIsFavorite = false;
  bool _filterDonatedTo = false;
  bool _filterIncludeArchived = false;
  String? _filterNgoNameContains;
  ProjectCategoryDto? _filterCategory;
  bool _sortNewest = false;

  // PUBLIC GETTERS
  String? get filterNameContains => _filterNameContains;
  bool get filterIsFavorite => _filterIsFavorite;
  bool get filterDonatedTo => _filterDonatedTo;
  bool get filterIncludeArchived => _filterIncludeArchived;
  String? get filterNgoNameContains => _filterNgoNameContains;
  ProjectCategoryDto? get filterCategory => _filterCategory;
  bool get sortNewest => _sortNewest;

  // CONSTRUCTOR
  ProjectListProvider({super.resultsPerPage});

  /// Sets filters or sorting arguments and fetches the first page
  Future<void> setFilterAndFetch({
    String? nameContains,
    bool? isFavorite,
    bool? donatedTo,
    bool? includeArchived,
    String? ngoNameContains,
    ProjectCategoryDto? category,
    bool? newest,
  }) async {
    _filterNameContains = nameContains ?? _filterNameContains;
    _filterIsFavorite = isFavorite ?? _filterIsFavorite;
    _filterDonatedTo = donatedTo ?? _filterDonatedTo;
    _filterIncludeArchived = includeArchived ?? _filterIncludeArchived;
    _filterNgoNameContains = ngoNameContains ?? _filterNgoNameContains;
    _filterCategory = category ?? _filterCategory;
    _sortNewest = newest ?? _sortNewest;
    await fetchFirstPage();
  }

  @override
  Future<ApiResponse<PaginatedList<Project>>> getFromServer() async {
    Response<GetProjectList200ResponseDto> response =
        await ApiService.shared.getProjectApi().getProjectList(
              donatorId: 1,
              paginationPage: currentPage,
              paginationPageSize: resultsPerPage,
              filterNameContains: _filterNameContains,
              filterIsFavorite: _filterIsFavorite,
              filterDonatedTo: _filterDonatedTo,
              filterIncludeArchived: _filterIncludeArchived,
              filterNgoNameContains: _filterNgoNameContains,
              filterCategory: _filterCategory,
              sortFor: _sortNewest ? "created_at" : "name",
              sortType: _sortNewest ? SortTypeDto.desc : SortTypeDto.asc,
            );

    if (response.data == null) {
      return ApiResponse(
          httpStatusCode: response.statusCode,
          httpStatusMessage: response.statusMessage,
          data: null);
    }

    final data = response.data!;
    final list = PaginatedList<Project>(
      entries: data.projects.map((dto) => Project.fromDto(dto)).toList(),
      paginationData: Pagination.fromDto(data.pagination),
    );

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: list);
  }
}
