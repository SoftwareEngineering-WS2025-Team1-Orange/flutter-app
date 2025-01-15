import 'package:openapi/src/model/config_dto.dart';
import 'package:openapi/src/model/donate_to_ngo201_response_all_of_project_dto.dart';
import 'package:openapi/src/model/donate_to_ngo201_response_dto.dart';
import 'package:openapi/src/model/donate_to_ngo_request_dto.dart';
import 'package:openapi/src/model/donate_to_project201_response_dto.dart';
import 'package:openapi/src/model/donate_to_project_request_dto.dart';
import 'package:openapi/src/model/donation_dto.dart';
import 'package:openapi/src/model/donation_response_dto.dart';
import 'package:openapi/src/model/donationbox_basic_dto.dart';
import 'package:openapi/src/model/donationbox_dto.dart';
import 'package:openapi/src/model/donationbox_register_dto.dart';
import 'package:openapi/src/model/donationbox_send_config_dto.dart';
import 'package:openapi/src/model/donator_dto.dart';
import 'package:openapi/src/model/donator_register_dto.dart';
import 'package:openapi/src/model/donator_update_dto.dart';
import 'package:openapi/src/model/earning_dto.dart';
import 'package:openapi/src/model/favorite_project_request_dto.dart';
import 'package:openapi/src/model/get_ngo_list200_response_dto.dart';
import 'package:openapi/src/model/get_project_list200_response_dto.dart';
import 'package:openapi/src/model/get_transaction_list200_response_dto.dart';
import 'package:openapi/src/model/last_solar_data_consumption_dto.dart';
import 'package:openapi/src/model/last_solar_data_dto.dart';
import 'package:openapi/src/model/last_solar_data_production_dto.dart';
import 'package:openapi/src/model/monero_mining_payout_basic_dto.dart';
import 'package:openapi/src/model/ngo_basic_dto.dart';
import 'package:openapi/src/model/ngo_dto.dart';
import 'package:openapi/src/model/pagination_dto.dart';
import 'package:openapi/src/model/power_supply_dto.dart';
import 'package:openapi/src/model/power_supply_register_dto.dart';
import 'package:openapi/src/model/project_basic_dto.dart';
import 'package:openapi/src/model/project_dto.dart';
import 'package:openapi/src/model/request_token_dto.dart';
import 'package:openapi/src/model/response_token_dto.dart';
import 'package:openapi/src/model/send_status_update_request_request_dto.dart';

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
        case 'ConfigDto':
          return ConfigDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonateToNgo201ResponseAllOfProjectDto':
          return DonateToNgo201ResponseAllOfProjectDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonateToNgo201ResponseDto':
          return DonateToNgo201ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonateToNgoRequestDto':
          return DonateToNgoRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonateToProject201ResponseDto':
          return DonateToProject201ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonateToProjectRequestDto':
          return DonateToProjectRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationDto':
          return DonationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationResponseDto':
          return DonationResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxBasicDto':
          return DonationboxBasicDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxDto':
          return DonationboxDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxRegisterDto':
          return DonationboxRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonationboxSendConfigDto':
          return DonationboxSendConfigDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorDto':
          return DonatorDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorRegisterDto':
          return DonatorRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DonatorUpdateDto':
          return DonatorUpdateDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'EarningDto':
          return EarningDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FavoriteProjectRequestDto':
          return FavoriteProjectRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetNgoList200ResponseDto':
          return GetNgoList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetProjectList200ResponseDto':
          return GetProjectList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'GetTransactionList200ResponseDto':
          return GetTransactionList200ResponseDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LastSolarDataConsumptionDto':
          return LastSolarDataConsumptionDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LastSolarDataDto':
          return LastSolarDataDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LastSolarDataProductionDto':
          return LastSolarDataProductionDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MoneroMiningPayoutBasicDto':
          return MoneroMiningPayoutBasicDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NGOBasicDto':
          return NGOBasicDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'NGODto':
          return NGODto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaginationDto':
          return PaginationDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyDto':
          return PowerSupplyDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PowerSupplyRegisterDto':
          return PowerSupplyRegisterDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ProjectBasicDto':
          return ProjectBasicDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ProjectCategoryDto':
          
          
        case 'ProjectDto':
          return ProjectDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RequestTokenDto':
          return RequestTokenDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResponseTokenDto':
          return ResponseTokenDto.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'SendStatusUpdateRequestRequestDto':
          return SendStatusUpdateRequestRequestDto.fromJson(value as Map<String, dynamic>) as ReturnType;
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