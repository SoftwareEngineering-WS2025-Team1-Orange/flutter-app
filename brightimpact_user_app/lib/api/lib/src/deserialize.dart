import 'package:openapi/src/model/donationbox_dto.dart';
import 'package:openapi/src/model/donationbox_register_dto.dart';
import 'package:openapi/src/model/donator_dto.dart';
import 'package:openapi/src/model/donator_register_dto.dart';
import 'package:openapi/src/model/power_supply_dto.dart';
import 'package:openapi/src/model/power_supply_register_dto.dart';
import 'package:openapi/src/model/response_token_dto.dart';
import 'package:openapi/src/model/wallet_dto.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'DonationboxDto':
          return DonationboxDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxRegisterDto':
          return DonationboxRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorDto':
          return DonatorDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorRegisterDto':
          return DonatorRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyDto':
          return PowerSupplyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyRegisterDto':
          return PowerSupplyRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResponseTokenDto':
          return ResponseTokenDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'WalletDto':
          return WalletDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }