//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ngo_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_ngo_list200_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetNgoList200ResponseDto {
  /// Returns a new [GetNgoList200ResponseDto] instance.
  GetNgoList200ResponseDto({

    required  this.ngos,

    required  this.pagination,
  });

  @JsonKey(
    
    name: r'ngos',
    required: true,
    includeIfNull: false,
  )


  final List<NGODto> ngos;



  @JsonKey(
    
    name: r'pagination',
    required: true,
    includeIfNull: false,
  )


  final PaginationDto pagination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetNgoList200ResponseDto &&
      other.ngos == ngos &&
      other.pagination == pagination;

    @override
    int get hashCode =>
        ngos.hashCode +
        pagination.hashCode;

  factory GetNgoList200ResponseDto.fromJson(Map<String, dynamic> json) => _$GetNgoList200ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetNgoList200ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

