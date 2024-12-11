# openapi.api.WalletApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**donatorDonatorIdWalletGet**](WalletApi.md#donatordonatoridwalletget) | **GET** /donator/{donator_id}/wallet | 


# **donatorDonatorIdWalletGet**
> WalletDto donatorDonatorIdWalletGet(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getWalletApi();
final int donatorId = 56; // int | 

try {
    final response = api.donatorDonatorIdWalletGet(donatorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling WalletApi->donatorDonatorIdWalletGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 

### Return type

[**WalletDto**](WalletDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

