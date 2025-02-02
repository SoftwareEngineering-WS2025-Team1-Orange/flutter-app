import 'package:bright_impact/state/api_provider_error.dart';
import 'package:bright_impact/state/api_provider_exception.dart';
import 'package:bright_impact/api/lib/openapi.dart';
import 'package:bright_impact/state/entity_provider/entity_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Pagination {
  final int totalResults;
  final int filteredResults;
  final int currentPage;
  final int pageSize;
  final int numberOfPages;

  Pagination(this.totalResults, this.filteredResults, this.currentPage,
      this.pageSize, this.numberOfPages);

  Pagination.fromDto(PaginationDto dto)
      : totalResults = dto.totalResults,
        filteredResults = dto.filteredResults,
        currentPage = dto.currentPage,
        pageSize = dto.currentPage,
        numberOfPages = dto.numberOfPages;
}

class PaginatedList<T> {
  List<T> entries;
  Pagination paginationData;

  PaginatedList({required this.entries, required this.paginationData});
}

abstract class ListProvider<T> with ChangeNotifier {
  // STATIC
  /// Keeps reference to all created instances of ListProvider
  static final Set<WeakReference<Object>> _weakProviderReferences = {};

  // PRIVATE ATTRIBUTES
  final int _resultsPerPage;
  bool _isLoading = false;
  bool _hasMore = true;

  /// Page number starting from 1 that this provider should loaded (including all pages before)
  int _currentPage = 1;

  /// Page number starting from 1 that already is loaded (including all pages before)
  int _loadedPage = 0;
  ApiProviderError? _loadingError;
  final List<T> _entries = [];

  // PUBLIC GETTER FOR PRIVATE ATTRIBUTES
  int get resultsPerPage => _resultsPerPage;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  int get currentPage => _currentPage;
  ApiProviderError? get loadingError => _loadingError;
  List<T> get entries => _entries;

  // CONSTRUCTOR
  ListProvider({int resultsPerPage = 3}) : _resultsPerPage = resultsPerPage {
    _addProvider(this);
  }

  /// Call this method to add created ListProvider as observer to refresh
  static _addProvider<T>(ListProvider<T> newProvider) {
    _weakProviderReferences.add(WeakReference(newProvider));
  }

  /// Can be called to refresh all instances of the ListProvider
  static Future<void> refreshAllListPages<T>() async {
    // Filtere nur Objekte, die noch existieren
    _weakProviderReferences.removeWhere((ref) => ref.target == null);
    for (var ref in _weakProviderReferences) {
      final target = ref.target;
      if (target is ListProvider<T>) {
        target.fetchFirstPage();
      }
    }
  }

  /// Deletes all fetched NGOs
  void _reset() {
    _currentPage = 1;
    _loadedPage = 0;
    _isLoading = false;
  }

  /// removes all existing list entries and fetches first page
  Future<void> fetchFirstPage({bool directlyEmptyList = false}) async {
    _reset();
    if (directlyEmptyList) {
      _entries.clear();
      notifyListeners();
    }
    await _fetch(clearOnReceive: true);
  }

  Future<void> fetchNextPage() async {
    if (hasMore && !isLoading) {
      _currentPage++;
      await _fetch();
    }
  }

  Future<ApiResponse<PaginatedList<T>>> getFromServer();

  /// Should be called from the UI to load NGOs
  Future<void> _fetch({bool clearOnReceive = false}) async {
    _isLoading = true;
    _loadingError = null;

    try {
      final response = await getFromServer();

      if (ApiProviderError.fromHttpCode(response.httpStatusCode) != null) {
        throw ApiProviderException(
            ApiProviderError.fromHttpCode(response.httpStatusCode)!,
            "Failed to load list: HTTP Code ${response.httpStatusCode}");
      }

      if (response.data == null) {
        throw ApiProviderException(
            ApiProviderError.unknownError, "Missing list response data");
      }

      final Pagination paginationData = response.data!.paginationData;
      final List<T> entries = response.data!.entries;

      // Checks that the next page is only appended if it has not been appended before
      // and that it is indeed the next page (page number incremented by 1)

      if (paginationData.currentPage == _currentPage &&
          paginationData.currentPage == _loadedPage + 1) {
        if (clearOnReceive) {
          _entries.clear();
          notifyListeners();
        }
        _hasMore = paginationData.currentPage < paginationData.numberOfPages;
        _entries.addAll(entries);
        _loadedPage = paginationData.currentPage;
      }
    } catch (e) {
      _reset();

      // Set provider error. If error is unknown, return unkown error.
      if (e is ApiProviderException) {
        _loadingError = e.errorType;
      } else if (e is DioException) {
        _loadingError = e.type == DioExceptionType.connectionError ||
                e.type == DioExceptionType.connectionTimeout ||
                e.type == DioExceptionType.receiveTimeout
            ? ApiProviderError.connectionError
            : ApiProviderError.fromHttpCode(e.response?.statusCode ?? 0);
      } else {
        _loadingError = ApiProviderError.unknownError;
      }

      debugPrint("Error fetching entity: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
