//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'ngo_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NGODto {
  /// Returns a new [NGODto] instance.
  NGODto({

    required  this.name,

    required  this.id,

     this.websiteUrl,

    required  this.contact,

    required  this.address,

    required  this.description,

     this.bannerUri,

    required  this.isFavorite,
  });

  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final int id;



  @JsonKey(
    
    name: r'website_url',
    required: false,
    includeIfNull: false,
  )


  final String? websiteUrl;



  @JsonKey(
    
    name: r'contact',
    required: true,
    includeIfNull: false,
  )


  final String contact;



  @JsonKey(
    
    name: r'address',
    required: true,
    includeIfNull: false,
  )


  final String address;



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
    required: true,
    includeIfNull: false,
  )


  final bool isFavorite;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NGODto &&
      other.name == name &&
      other.id == id &&
      other.websiteUrl == websiteUrl &&
      other.contact == contact &&
      other.address == address &&
      other.description == description &&
      other.bannerUri == bannerUri &&
      other.isFavorite == isFavorite;

    @override
    int get hashCode =>
        name.hashCode +
        id.hashCode +
        websiteUrl.hashCode +
        contact.hashCode +
        address.hashCode +
        description.hashCode +
        bannerUri.hashCode +
        isFavorite.hashCode;

  factory NGODto.fromJson(Map<String, dynamic> json) => _$NGODtoFromJson(json);

  Map<String, dynamic> toJson() => _$NGODtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

