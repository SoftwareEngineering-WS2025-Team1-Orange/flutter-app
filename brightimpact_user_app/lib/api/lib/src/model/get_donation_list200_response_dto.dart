//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/donation_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_donation_list200_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetDonationList200ResponseDto {
  /// Returns a new [GetDonationList200ResponseDto] instance.
  GetDonationList200ResponseDto({

    required  this.donations,

    required  this.pagination,
  });

  @JsonKey(
    
    name: r'donations',
    required: true,
    includeIfNull: false,
  )


  final List<DonationDto> donations;



  @JsonKey(
    
    name: r'pagination',
    required: true,
    includeIfNull: false,
  )


  final PaginationDto pagination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetDonationList200ResponseDto &&
      other.donations == donations &&
      other.pagination == pagination;

    @override
    int get hashCode =>
        donations.hashCode +
        pagination.hashCode;

  factory GetDonationList200ResponseDto.fromJson(Map<String, dynamic> json) => _$GetDonationList200ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetDonationList200ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

