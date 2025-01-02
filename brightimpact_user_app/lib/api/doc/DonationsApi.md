# openapi.api.DonationsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTransactionList**](DonationsApi.md#gettransactionlist) | **GET** /api-donator/transaction/donator/{donator_id} | 


# **getTransactionList**
> GetTransactionList200ResponseDto getTransactionList(donatorId, filterDonationNgoId, filterDonationNgoName, filterDonationProjectId, filterDonationProjectName, filterEarningDonationboxId, filterCreatedFrom, filterCreatedTo, filterAmountFrom, filterAmountTo, sortFor, sortType, paginationPage, paginationPageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationsApi();
final int donatorId = 56; // int | 
final int filterDonationNgoId = 56; // int | 
final String filterDonationNgoName = filterDonationNgoName_example; // String | 
final int filterDonationProjectId = 56; // int | 
final String filterDonationProjectName = filterDonationProjectName_example; // String | 
final int filterEarningDonationboxId = 56; // int | 
final DateTime filterCreatedFrom = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime filterCreatedTo = 2013-10-20T19:20:30+01:00; // DateTime | 
final num filterAmountFrom = 8.14; // num | 
final num filterAmountTo = 8.14; // num | 
final String sortFor = sortFor_example; // String | The field to sort by
final SortTypeDto sortType = ; // SortTypeDto | 
final int paginationPage = 56; // int | 
final int paginationPageSize = 56; // int | 

try {
    final response = api.getTransactionList(donatorId, filterDonationNgoId, filterDonationNgoName, filterDonationProjectId, filterDonationProjectName, filterEarningDonationboxId, filterCreatedFrom, filterCreatedTo, filterAmountFrom, filterAmountTo, sortFor, sortType, paginationPage, paginationPageSize);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonationsApi->getTransactionList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **filterDonationNgoId** | **int**|  | [optional] 
 **filterDonationNgoName** | **String**|  | [optional] 
 **filterDonationProjectId** | **int**|  | [optional] 
 **filterDonationProjectName** | **String**|  | [optional] 
 **filterEarningDonationboxId** | **int**|  | [optional] 
 **filterCreatedFrom** | **DateTime**|  | [optional] 
 **filterCreatedTo** | **DateTime**|  | [optional] 
 **filterAmountFrom** | **num**|  | [optional] 
 **filterAmountTo** | **num**|  | [optional] 
 **sortFor** | **String**| The field to sort by | [optional] 
 **sortType** | [**SortTypeDto**](.md)|  | [optional] 
 **paginationPage** | **int**|  | [optional] [default to 1]
 **paginationPageSize** | **int**|  | [optional] [default to 20]

### Return type

[**GetTransactionList200ResponseDto**](GetTransactionList200ResponseDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

