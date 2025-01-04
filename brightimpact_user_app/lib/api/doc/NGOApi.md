# openapi.api.NGOApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getNgoList**](NGOApi.md#getngolist) | **GET** /api-donator/ngo/donator/{donator_id} | 


# **getNgoList**
> GetNgoList200ResponseDto getNgoList(donatorId, filterNgoId, filterIsFavorite, filterNameContains, filterDonatedTo, paginationPage, paginationPageSize, sortType, sortFor)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getNGOApi();
final int donatorId = 56; // int | 
final int filterNgoId = 56; // int | 
final bool filterIsFavorite = true; // bool | 
final String filterNameContains = filterNameContains_example; // String | 
final bool filterDonatedTo = true; // bool | 
final int paginationPage = 56; // int | 
final int paginationPageSize = 56; // int | 
final SortTypeDto sortType = ; // SortTypeDto | 
final String sortFor = sortFor_example; // String | The field to sort by

try {
    final response = api.getNgoList(donatorId, filterNgoId, filterIsFavorite, filterNameContains, filterDonatedTo, paginationPage, paginationPageSize, sortType, sortFor);
    print(response);
} catch on DioException (e) {
    print('Exception when calling NGOApi->getNgoList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **filterNgoId** | **int**|  | [optional] 
 **filterIsFavorite** | **bool**|  | [optional] 
 **filterNameContains** | **String**|  | [optional] 
 **filterDonatedTo** | **bool**|  | [optional] 
 **paginationPage** | **int**|  | [optional] [default to 1]
 **paginationPageSize** | **int**|  | [optional] [default to 20]
 **sortType** | [**SortTypeDto**](.md)|  | [optional] 
 **sortFor** | **String**| The field to sort by | [optional] 

### Return type

[**GetNgoList200ResponseDto**](GetNgoList200ResponseDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

