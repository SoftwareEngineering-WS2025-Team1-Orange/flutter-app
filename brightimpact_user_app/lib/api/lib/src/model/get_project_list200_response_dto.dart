//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/project_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_project_list200_response_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetProjectList200ResponseDto {
  /// Returns a new [GetProjectList200ResponseDto] instance.
  GetProjectList200ResponseDto({

    required  this.projects,

    required  this.pagination,
  });

  @JsonKey(
    
    name: r'projects',
    required: true,
    includeIfNull: false,
  )


  final List<ProjectDto> projects;



  @JsonKey(
    
    name: r'pagination',
    required: true,
    includeIfNull: false,
  )


  final PaginationDto pagination;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetProjectList200ResponseDto &&
      other.projects == projects &&
      other.pagination == pagination;

    @override
    int get hashCode =>
        projects.hashCode +
        pagination.hashCode;

  factory GetProjectList200ResponseDto.fromJson(Map<String, dynamic> json) => _$GetProjectList200ResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetProjectList200ResponseDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

