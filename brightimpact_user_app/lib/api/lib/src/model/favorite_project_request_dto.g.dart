// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_project_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProjectRequestDto _$FavoriteProjectRequestDtoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'FavoriteProjectRequestDto',
      json,
      ($checkedConvert) {
        final val = FavoriteProjectRequestDto(
          favorite: $checkedConvert('favorite', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$FavoriteProjectRequestDtoToJson(
        FavoriteProjectRequestDto instance) =>
    <String, dynamic>{
      if (instance.favorite case final value?) 'favorite': value,
    };
