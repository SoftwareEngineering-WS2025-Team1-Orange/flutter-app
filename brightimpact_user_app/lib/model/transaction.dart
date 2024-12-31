import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a transaction which can be either a donation or earning. Class Transaction should be to deal with Transaction data in the UI.
abstract class Transaction {
  final DateTime datetime;
  final double amount;

  Transaction(this.datetime, this.amount);
}

class Donation extends Transaction {
  final int id;
  final int ngoId;
  final String ngoName;
  final int projectId;
  final String projectName;

  Donation(super.datetime, super.amount, this.id, this.ngoId, this.ngoName,
      this.projectId, this.projectName);

  Donation.fromDto(DonationDto dto)
      : id = dto.id,
        ngoId = dto.ngo.id ?? 0,
        ngoName = dto.ngo.name ?? "FEHLT",
        projectId = dto.project.id ?? 0,
        projectName = dto.project.name ?? "FEHLT",
        super(dto.createdAt, dto.amount.toDouble());
}

class Earning extends Transaction {
  final int id;
  final int donationboxId;
  final String donationboxName;
  final Duration calcDuration;

  Earning(
    super.datetime,
    super.amount,
    this.id,
    this.donationboxId,
    this.donationboxName,
    this.calcDuration,
  );

  // TODO: Earning.fromDto() ...
}
