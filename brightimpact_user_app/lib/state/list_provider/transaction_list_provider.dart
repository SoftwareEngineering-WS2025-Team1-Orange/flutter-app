import 'package:bright_impact/model/transaction.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';

class TransactionListProvider extends ListProvider<Transaction> {
  // CONSTRUCTOR
  TransactionListProvider({super.resultsPerPage});

  @override
  Future<ApiResponse<PaginatedList<Transaction>>> getFromServer() async {
    // TODO: Implement
    /*Response<GetNgoList200ResponseDto> response =
        await ApiService.shared.getNGOApi().getNgoList(
              donatorId: 1,
              paginationPage: currentPage,
              paginationPageSize: resultsPerPage,
              filterIsFavorite: _filterIsFavorite,
              filterDonatedTo: _filterDonatedTo,
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
        data: list);*/

    return ApiResponse(
        httpStatusCode: 200,
        httpStatusMessage: "",
        data: PaginatedList<Transaction>(
            entries: [Donation(
        DateTime.now(),
        -2.00,
        1,
        101,
        "New Roots e.V.",
        201,
        "Beach Cleaning in Kenia",
      ),
      Earning(
        DateTime.now(),
        0.14,
        2,
        301,
        "Computing Box 1",
        Duration(minutes: 35, seconds: 3),
      ),
      Donation(
        DateTime.now(),
        -0.50,
        3,
        102,
        "New Roots e.V.",
        202,
        "School Material",
      ),],
            paginationData: Pagination(3, 3, 1, resultsPerPage, 1)));
  }
}
