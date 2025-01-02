import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a nonprofit organization. Class NGO should be to deal with NGO data in the UI.
class NGO {
  final String name;
  final int id;
  final String? websiteUrl;
  final String contact;
  final String address;
  final String description;
  final String bannerUri;
  final bool isFavorite;

  NGO(this.name, this.id, this.websiteUrl, this.contact, this.address,
      this.description, this.bannerUri, this.isFavorite);

  NGO.fromDto(NGODto dto)
      : name = dto.name,
        id = dto.id,
        websiteUrl = dto.websiteUrl,
        contact = dto.contact,
        address = dto.address,
        description = dto.description,
        bannerUri = dto.bannerUri ??
           "https://lirp.cdn-website.com/58002456/dms3rep/multi/opt/Logo_w_150ppi-134w.png",
        isFavorite = dto.isFavorite ?? false;
}
