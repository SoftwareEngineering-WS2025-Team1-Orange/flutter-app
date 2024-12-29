//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
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

     this.ngoId,

     this.ngoName,

     this.isFavorite,

    required  this.fundraisingGoal,

    required  this.fundraisingCurrent,

    required  this.targetDate,

     this.createdAt,

    required  this.fundraisingClosed,

    required  this.progress,

     this.isArchived,
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
    
    name: r'ngo_id',
    required: false,
    includeIfNull: false,
  )


  final int? ngoId;



  @JsonKey(
    
    name: r'ngo_name',
    required: false,
    includeIfNull: false,
  )


  final String? ngoName;



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
    
    name: r'is_archived',
    required: false,
    includeIfNull: false,
  )


  final bool? isArchived;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ProjectDto &&
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.bannerUri == bannerUri &&
      other.ngoId == ngoId &&
      other.ngoName == ngoName &&
      other.isFavorite == isFavorite &&
      other.fundraisingGoal == fundraisingGoal &&
      other.fundraisingCurrent == fundraisingCurrent &&
      other.targetDate == targetDate &&
      other.createdAt == createdAt &&
      other.fundraisingClosed == fundraisingClosed &&
      other.progress == progress &&
      other.isArchived == isArchived;

    @override
    int get hashCode =>
        id.hashCode +
        name.hashCode +
        description.hashCode +
        bannerUri.hashCode +
        ngoId.hashCode +
        ngoName.hashCode +
        isFavorite.hashCode +
        fundraisingGoal.hashCode +
        fundraisingCurrent.hashCode +
        targetDate.hashCode +
        createdAt.hashCode +
        fundraisingClosed.hashCode +
        progress.hashCode +
        isArchived.hashCode;

  factory ProjectDto.fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

