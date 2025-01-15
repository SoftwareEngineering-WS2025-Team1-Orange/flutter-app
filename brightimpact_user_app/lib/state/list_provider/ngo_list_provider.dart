import 'package:bright_impact/model/ngo.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:dio/dio.dart';

class NgoListProvider extends ListProvider<NGO> {
  // PRIVATE ATTRIBUTES
  bool _filterIsFavorite = false;
  bool _filterDonatedTo = false;
  bool _sortNewest = false;
  final int _donatorId;

  // PUBLIC GETTER FOR PRIVATE ATTRIBUTES
  bool get filterIsFavorite => _filterIsFavorite;
  bool get filterDonatedTo => _filterDonatedTo;
  bool get sortNewest => _sortNewest;
  int get donatorId => _donatorId;

  // CONSTRUCTOR
  NgoListProvider({super.resultsPerPage, required donatorId})
      : _donatorId = donatorId;

  /// Sets the passed filter or sort arguments and then automatically fetched the list of NGOs
  Future<void> setFilterAndFetch(
      {bool? isFavorite, bool? donatedTo, bool? newest}) async {
    _filterIsFavorite = isFavorite ?? filterIsFavorite;
    _filterDonatedTo = donatedTo ?? filterDonatedTo;
    _sortNewest = newest ?? sortNewest;
    await fetchFirstPage(directlyEmptyList: true);
  }

  @override
  Future<ApiResponse<PaginatedList<NGO>>> getFromServer() async {
    Response<GetNgoList200ResponseDto> response =
        await ApiService.shared.api.getNGOApi().getNgoList(
              donatorId: donatorId,
              paginationPage: currentPage,
              paginationPageSize: resultsPerPage,
              filterIsFavorite: _filterIsFavorite ? true : null,
              filterDonatedTo: _filterDonatedTo ? true : null,
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
    final list = PaginatedList<NGO>(
        entries: data.ngos.map((dto) => NGO.fromDto(dto)).toList(),
        paginationData: Pagination.fromDto(data.pagination));

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: list);
  }
}
