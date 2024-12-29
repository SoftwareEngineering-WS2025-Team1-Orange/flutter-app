//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';


enum ProjectCategoryDto {
      @JsonValue(r'Education')
      education(r'Education'),
      @JsonValue(r'Health')
      health(r'Health'),
      @JsonValue(r'Environment')
      environment(r'Environment'),
      @JsonValue(r'Human_Rights')
      humanRights(r'Human_Rights'),
      @JsonValue(r'Animal_Rights')
      animalRights(r'Animal_Rights'),
      @JsonValue(r'Social')
      social(r'Social'),
      @JsonValue(r'Other')
      other(r'Other');

  const ProjectCategoryDto(this.value);

  final String value;

  @override
  String toString() => value;
}
