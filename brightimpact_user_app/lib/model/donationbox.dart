import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a donationbox. Class Donationbox should be to deal with donationbox data in the UI.
class Donationbox {
  final int id;
  final String cuid;
  final String name;
  final DonationboxStatus status;
  final DonationboxSolarStatus solarStatus;
  final double? powerSurplusKiloWatt;
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
    this.powerSurplusKiloWatt,
  );

  Donationbox.fromDto(DonationboxDto dto)
      : id = dto.id,
        cuid = dto.cuid,
        name = dto.name,
        status = DonationboxStatus.fromDto(dto.status),
        solarStatus = DonationboxSolarStatus.fromDto(dto.solarStatus),
        powerSurplusKiloWatt = dto.lastSolarData?.production.grid == null ? null : -dto.lastSolarData!.production.grid!/1000.0,
        activeTimeEachDaySec =
            dto.averageWorkingTimePerDayInSeconds?.toDouble(),
        earningsAvgDayCent = dto.averageIncomePerDayInCent?.toDouble() ?? 0;
}

enum DonationboxSolarStatus {
  noConfig,
  pending,
  error,
  ok;

  factory DonationboxSolarStatus.fromDto(DonationboxDtoSolarStatusEnum dto) {
    switch (dto) {
      case DonationboxDtoSolarStatusEnum.ok:
        return DonationboxSolarStatus.ok;
      case DonationboxDtoSolarStatusEnum.error:
        return DonationboxSolarStatus.error;
      case DonationboxDtoSolarStatusEnum.pending:
        return DonationboxSolarStatus.pending;
      case DonationboxDtoSolarStatusEnum.uninitialized:
        return DonationboxSolarStatus.noConfig;
    }
  }
}

enum DonationboxStatus {
  connected,
  working,
  disconnected,
  uninitialized,
  unknownStatusCode;

  factory DonationboxStatus.fromDto(DonationboxDtoStatusEnum dto) {
    switch (dto) {
      case DonationboxDtoStatusEnum.connected:
        return DonationboxStatus.connected;
      case DonationboxDtoStatusEnum.working:
        return DonationboxStatus.working;
      case DonationboxDtoStatusEnum.unknownStatusCode:
      case DonationboxDtoStatusEnum.disconnected:
        return DonationboxStatus.disconnected;
      case DonationboxDtoStatusEnum.uninitialized:
        return DonationboxStatus.uninitialized;
    }
  }
}
