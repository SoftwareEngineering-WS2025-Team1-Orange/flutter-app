import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a donationbox. Class Donationbox should be to deal with donationbox data in the UI.
class Donationbox {
  final int id;
  final String cuid;
  final String name;
  final DonationboxStatus status;
  final DonationboxSolarStatus solarStatus;
  final double? powerSurplusWatt;
  final double? activeTimeEachDaySec;
  final double earningsAvgDayCent;

  Donationbox(
    this.id,
    this.cuid,
    this.name,
    this.status,
    this.solarStatus,
    this.activeTimeEachDaySec,
    this.earningsAvgDayCent,
    this.powerSurplusWatt,
  );

  Donationbox.fromDto(DonationboxDto dto)
      : id = dto.id,
        cuid = dto.cuid,
        name = dto.name,
        status = DonationboxStatus.working,
        solarStatus = DonationboxSolarStatus.ok,
        powerSurplusWatt = dto.powerConsumption?.toDouble(),
        activeTimeEachDaySec = 20439,
        earningsAvgDayCent = 6;
}

enum DonationboxSolarStatus {
  noConfig,
  pending,
  error,
  ok,
}

enum DonationboxStatus { connected, working, disconnected }
