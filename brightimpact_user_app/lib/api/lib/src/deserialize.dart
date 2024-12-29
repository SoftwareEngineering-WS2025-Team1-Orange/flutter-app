import 'package:openapi/src/model/donation_dto.dart';
import 'package:openapi/src/model/donation_ngo_dto.dart';
import 'package:openapi/src/model/donation_project_dto.dart';
import 'package:openapi/src/model/donationbox_dto.dart';
import 'package:openapi/src/model/donationbox_register_dto.dart';
import 'package:openapi/src/model/donator_dto.dart';
import 'package:openapi/src/model/donator_login_dto.dart';
import 'package:openapi/src/model/donator_register_dto.dart';
import 'package:openapi/src/model/get_donation_list200_response_dto.dart';
import 'package:openapi/src/model/get_ngo_list200_response_dto.dart';
import 'package:openapi/src/model/get_project_list200_response_dto.dart';
import 'package:openapi/src/model/login200_response_dto.dart';
import 'package:openapi/src/model/ngo_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:openapi/src/model/power_supply_dto.dart';
import 'package:openapi/src/model/power_supply_register_dto.dart';
import 'package:openapi/src/model/project_dto.dart';
import 'package:openapi/src/model/response_token_dto.dart';

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
        case 'DonationDto':
          return DonationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationNgoDto':
          return DonationNgoDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationProjectDto':
          return DonationProjectDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxDto':
          return DonationboxDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxRegisterDto':
          return DonationboxRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorDto':
          return DonatorDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorLoginDto':
          return DonatorLoginDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorRegisterDto':
          return DonatorRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetDonationList200ResponseDto':
          return GetDonationList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetNgoList200ResponseDto':
          return GetNgoList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetProjectList200ResponseDto':
          return GetProjectList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Login200ResponseDto':
          return Login200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NGODto':
          return NGODto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaginationDto':
          return PaginationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyDto':
          return PowerSupplyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyRegisterDto':
          return PowerSupplyRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ProjectCategoryDto':
          
          
        case 'ProjectDto':
          return ProjectDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResponseTokenDto':
          return ResponseTokenDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SortTypeDto':
          
          
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