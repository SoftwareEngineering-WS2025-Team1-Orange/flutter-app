import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a donationbox. Class Donationbox should be to deal with donationbox data in the UI.
class Donationbox {
  final int id;
  final String cuid;
  final String name;
  final DonationboxDtoLastStatusEnum lastStatus;
  final double? powerConsumption;
  final String? powerSupplyId;

  Donationbox(this.id, this.cuid, this.name, this.lastStatus, this.powerConsumption, this.powerSupplyId);

  Donationbox.fromDto(DonationboxDto dto)
      : id = dto.id,
        cuid = dto.cuid,
        name = dto.name,
        lastStatus = dto.lastStatus,
        powerConsumption = dto.powerConsumption?.toDouble(),
        powerSupplyId = dto.powerSupplyId;

}
