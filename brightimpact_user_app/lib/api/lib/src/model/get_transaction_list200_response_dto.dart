//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donation_dto.dart';
import 'package:openapi/src/model/earning_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_list200_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetTransactionList200ResponseDto {
  /// Returns a new [GetTransactionList200ResponseDto] instance.
  GetTransactionList200ResponseDto({

    required  this.donations,

    required  this.earnings,

    required  this.pagination,
  });

  @JsonKey(
    
    name: r'donations',
    required: true,
    includeIfNull: false,
  )


  final List<DonationDto> donations;



  @JsonKey(
    
    name: r'earnings',
    required: true,
    includeIfNull: false,
  )


  final List<EarningDto> earnings;



  @JsonKey(
    
    name: r'pagination',
    required: true,
    includeIfNull: false,
  )


  final PaginationDto pagination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetTransactionList200ResponseDto &&
      other.donations == donations &&
      other.earnings == earnings &&
      other.pagination == pagination;

    @override
    int get hashCode =>
        donations.hashCode +
        earnings.hashCode +
        pagination.hashCode;

  factory GetTransactionList200ResponseDto.fromJson(Map<String, dynamic> json) => _$GetTransactionList200ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionList200ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

