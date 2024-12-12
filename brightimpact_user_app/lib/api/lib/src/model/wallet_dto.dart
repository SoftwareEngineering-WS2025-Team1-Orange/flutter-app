//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'wallet_dto.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WalletDto {
  /// Returns a new [WalletDto] instance.
  WalletDto({

    required  this.balance,
  });

  @JsonKey(
    
    name: r'balance',
    required: true,
    includeIfNull: false,
  )


  final num balance;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WalletDto &&
      other.balance == balance;

    @override
    int get hashCode =>
        balance.hashCode;

  factory WalletDto.fromJson(Map<String, dynamic> json) => _$WalletDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WalletDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

