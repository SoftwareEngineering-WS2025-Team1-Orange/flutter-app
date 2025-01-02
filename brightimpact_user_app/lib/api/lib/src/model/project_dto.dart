//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/ngo_basic_dto.dart';
import 'package:openapi/src/model/project_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ProjectDto {
  /// Returns a new [ProjectDto] instance.
  ProjectDto({

    required  this.id,

    required  this.name,

    required  this.description,

     this.bannerUri,

     this.isFavorite,

    required  this.fundraisingGoal,

    required  this.fundraisingCurrent,

    required  this.targetDate,

     this.createdAt,

    required  this.fundraisingClosed,

    required  this.progress,

    required  this.category,

    required  this.ngo,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'description',
    required: true,
    includeIfNull: false,
  )


  final String description;



  @JsonKey(
    
    name: r'banner_uri',
    required: false,
    includeIfNull: false,
  )


  final String? bannerUri;



  @JsonKey(
    
    name: r'is_favorite',
    required: false,
    includeIfNull: false,
  )


  final bool? isFavorite;



  @JsonKey(
    
    name: r'fundraising_goal',
    required: true,
    includeIfNull: false,
  )


  final num fundraisingGoal;



  @JsonKey(
    
    name: r'fundraising_current',
    required: true,
    includeIfNull: false,
  )


  final num fundraisingCurrent;



  @JsonKey(
    
    name: r'target_date',
    required: true,
    includeIfNull: false,
  )


  final DateTime targetDate;



  @JsonKey(
    
    name: r'created_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? createdAt;



  @JsonKey(
    
    name: r'fundraising_closed',
    required: true,
    includeIfNull: false,
  )


  final bool fundraisingClosed;



  @JsonKey(
    
    name: r'progress',
    required: true,
    includeIfNull: false,
  )


  final num progress;



  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final ProjectCategoryDto category;



  @JsonKey(
    
    name: r'ngo',
    required: true,
    includeIfNull: false,
  )


  final NGOBasicDto ngo;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ProjectDto &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.bannerUri == bannerUri &&
      other.isFavorite == isFavorite &&
      other.fundraisingGoal == fundraisingGoal &&
      other.fundraisingCurrent == fundraisingCurrent &&
      other.targetDate == targetDate &&
      other.createdAt == createdAt &&
      other.fundraisingClosed == fundraisingClosed &&
      other.progress == progress &&
      other.category == category &&
      other.ngo == ngo;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        description.hashCode +
        bannerUri.hashCode +
        isFavorite.hashCode +
        fundraisingGoal.hashCode +
        fundraisingCurrent.hashCode +
        targetDate.hashCode +
        createdAt.hashCode +
        fundraisingClosed.hashCode +
        progress.hashCode +
        category.hashCode +
        ngo.hashCode;

  factory ProjectDto.fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

