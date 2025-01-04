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
  String? _filterNgoNameContains;
  ProjectCategoryDto? _filterCategory;
  bool _sortNewest = false;
  final int _donatorId;

  // PUBLIC GETTERS
  String? get filterNameContains => _filterNameContains;
  bool get filterIsFavorite => _filterIsFavorite;
  bool get filterDonatedTo => _filterDonatedTo;
  String? get filterNgoNameContains => _filterNgoNameContains;
  ProjectCategoryDto? get filterCategory => _filterCategory;
  bool get sortNewest => _sortNewest;
  int get donatorId => _donatorId;

  // CONSTRUCTOR
  ProjectListProvider({super.resultsPerPage, required donatorId})
      : _donatorId = donatorId;

  /// Sets filters or sorting arguments and fetches the first page
  Future<void> setFilterAndFetch({
    String? nameContains,
    bool? isFavorite,
    bool? donatedTo,
    String? ngoNameContains,
    ProjectCategoryDto? category,
    bool? newest,
  }) async {
    _filterNameContains = nameContains ?? _filterNameContains;
    _filterIsFavorite = isFavorite ?? _filterIsFavorite;
    _filterDonatedTo = donatedTo ?? _filterDonatedTo;
    _filterNgoNameContains = ngoNameContains ?? _filterNgoNameContains;
    _filterCategory = category ?? _filterCategory;
    _sortNewest = newest ?? _sortNewest;
    await fetchFirstPage();
  }

  @override
  Future<ApiResponse<PaginatedList<Project>>> getFromServer() async {
    Response<GetProjectList200ResponseDto> response =
        await ApiService.shared.api.getProjectApi().getProjectList(
              donatorId: donatorId,
              paginationPage: currentPage,
              paginationPageSize: resultsPerPage,
              filterNameContains: _filterNameContains,
              filterIsFavorite: _filterIsFavorite ? true : null,
              filterDonatedTo: _filterDonatedTo ? true : null,
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
