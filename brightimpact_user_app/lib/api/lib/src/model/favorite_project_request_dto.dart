//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'favorite_project_request_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FavoriteProjectRequestDto {
  /// Returns a new [FavoriteProjectRequestDto] instance.
  FavoriteProjectRequestDto({

     this.favorite,
  });

  @JsonKey(
    
    name: r'favorite',
    required: false,
    includeIfNull: false,
  )


  final bool? favorite;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FavoriteProjectRequestDto &&
      other.favorite == favorite;

    @override
    int get hashCode =>
        favorite.hashCode;

  factory FavoriteProjectRequestDto.fromJson(Map<String, dynamic> json) => _$FavoriteProjectRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProjectRequestDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

