//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'pagination_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationDto {
  /// Returns a new [PaginationDto] instance.
  PaginationDto({

    required  this.totalResults,

    required  this.filteredResults,

    required  this.currentPage,

    required  this.pageSize,

    required  this.numberOfPages,
  });

  @JsonKey(
    
    name: r'totalResults',
    required: true,
    includeIfNull: false,
  )


  final int totalResults;



  @JsonKey(
    
    name: r'filteredResults',
    required: true,
    includeIfNull: false,
  )


  final int filteredResults;



  @JsonKey(
    
    name: r'currentPage',
    required: true,
    includeIfNull: false,
  )


  final int currentPage;



  @JsonKey(
    
    name: r'pageSize',
    required: true,
    includeIfNull: false,
  )


  final int pageSize;



  @JsonKey(
    
    name: r'numberOfPages',
    required: true,
    includeIfNull: false,
  )


  final int numberOfPages;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaginationDto &&
      other.totalResults == totalResults &&
      other.filteredResults == filteredResults &&
      other.currentPage == currentPage &&
      other.pageSize == pageSize &&
      other.numberOfPages == numberOfPages;

    @override
    int get hashCode =>
        totalResults.hashCode +
        filteredResults.hashCode +
        currentPage.hashCode +
        pageSize.hashCode +
        numberOfPages.hashCode;

  factory PaginationDto.fromJson(Map<String, dynamic> json) => _$PaginationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

