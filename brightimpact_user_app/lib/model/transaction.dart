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
  final int? projectId;
  final String? projectName;

  Donation(super.datetime, super.amount, this.id, this.ngoId, this.ngoName,
      this.projectId, this.projectName);

  Donation.fromDto(DonationDto dto)
      : id = dto.id,
        ngoId = dto.ngo.id,
        ngoName = dto.ngo.name,
        projectId = dto.project?.id,
        projectName = dto.project?.name,
        super(dto.createdAt, -dto.amountInCent.toDouble());
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

  Earning.fromDto(EarningDto dto)
      : id = dto.id,
        donationboxId = dto.donationBox.id,
        donationboxName = dto.donationBox.name,
        calcDuration = dto.moneroMiningPayout.timestamp.difference(dto.moneroMiningPayout.lastPayoutTimestamp),
        super(dto.createdAt, dto.amountInCent.toDouble());
}
