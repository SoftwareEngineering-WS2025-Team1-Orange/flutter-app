// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ngo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NGODto _$NGODtoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'NGODto',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'name',
            'id',
            'contact',
            'address',
            'description',
            'is_favorite'
          ],
        );
        final val = NGODto(
          name: $checkedConvert('name', (v) => v as String),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          websiteUrl: $checkedConvert('website_url', (v) => v as String?),
          contact: $checkedConvert('contact', (v) => v as String),
          address: $checkedConvert('address', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          bannerUri: $checkedConvert('banner_uri', (v) => v as String?),
          isFavorite: $checkedConvert('is_favorite', (v) => v as bool),
        );
        return val;
      },
      fieldKeyMap: const {
        'websiteUrl': 'website_url',
        'bannerUri': 'banner_uri',
        'isFavorite': 'is_favorite'
      },
    );

Map<String, dynamic> _$NGODtoToJson(NGODto instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      if (instance.websiteUrl case final value?) 'website_url': value,
      'contact': instance.contact,
      'address': instance.address,
      'description': instance.description,
      if (instance.bannerUri case final value?) 'banner_uri': value,
      'is_favorite': instance.isFavorite,
    };
