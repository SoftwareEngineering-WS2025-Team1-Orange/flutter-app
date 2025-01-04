import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a project. This class handles Project data in the UI.
class Project {
  final int id;
  final String name;
  final String description;
  final String bannerUri;
  final int ngoId;
  final String ngoName;
  final bool isFavorite;
  final num fundraisingGoal;
  final num fundraisingCurrent;
  final DateTime targetDate;
  final DateTime createdAt;
  final bool fundraisingClosed;
  final num progress;
  final List<ProjectCategoryDto> category;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.bannerUri,
    required this.ngoId,
    required this.ngoName,
    required this.isFavorite,
    required this.fundraisingGoal,
    required this.fundraisingCurrent,
    required this.targetDate,
    required this.createdAt,
    required this.fundraisingClosed,
    required this.progress,
    required this.category,
  });

  /// Constructs a Project object from the API DTO
  Project.fromDto(ProjectDto dto)
      : id = dto.id,
        name = dto.name,
        description = dto.description,
        bannerUri = dto.bannerUri ??
            "https://lirp.cdn-website.com/58002456/dms3rep/multi/opt/IMG_8142-1920w.jpg",
        ngoId = dto.ngo.id,
        ngoName = dto.ngo.name,
        isFavorite = dto.isFavorite,
        fundraisingGoal = dto.fundraisingGoal,
        fundraisingCurrent = dto.fundraisingCurrent,
        targetDate = dto.targetDate,
        createdAt = dto.createdAt,
        fundraisingClosed = dto.fundraisingClosed,
        progress = dto.progress,
        category = List.empty(); //dto.category;
}
