import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/model/transaction.dart';
import 'package:bright_impact/state/api_service.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:bright_impact/state/list_provider/list_provider.dart';
import 'package:dio/dio.dart';

class TransactionListProvider extends ListProvider<Transaction> {
  final int _donatorId;
  int get donatorId => _donatorId;

  // CONSTRUCTOR
  TransactionListProvider({super.resultsPerPage, required donatorId})
      : _donatorId = donatorId;

  @override
  Future<ApiResponse<PaginatedList<Transaction>>> getFromServer() async {
    Response<GetTransactionList200ResponseDto> response =
        await ApiService.shared.api.getDonationsApi().getTransactionList(
              donatorId: donatorId,
              paginationPage: currentPage,
              paginationPageSize: resultsPerPage,
              sortFor: "created_at",
              sortType: SortTypeDto.desc,
            );

    if (response.data == null) {
      return ApiResponse(
          httpStatusCode: response.statusCode,
          httpStatusMessage: response.statusMessage,
          data: null);
    }

    final data = response.data!;
    // Earnings and Donations are received seperately
    final earnings = data.earnings.map((dto) => Earning.fromDto(dto)).toList();
    final donations =
        data.donations.map((dto) => Donation.fromDto(dto)).toList();

    // Earnings and Donations are merges as List of Transactions and then sorted by created_at desc
    List<Transaction> entries = [];
    entries.addAll(earnings);
    entries.addAll(donations);
    entries.sort((b, a) => a.datetime.compareTo(b.datetime));

    final list = PaginatedList<Transaction>(
        entries: entries, paginationData: Pagination.fromDto(data.pagination));

    return ApiResponse(
        httpStatusCode: response.statusCode,
        httpStatusMessage: response.statusMessage,
        data: list);
  }
}
