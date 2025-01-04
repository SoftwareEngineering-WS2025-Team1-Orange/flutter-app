# openapi.api.DonatorApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDonator**](DonatorApi.md#getdonator) | **GET** /api-donator/donator/{donator_id} | 
[**getDonatorByToken**](DonatorApi.md#getdonatorbytoken) | **GET** /api-donator/donator/me | 
[**registerDonator**](DonatorApi.md#registerdonator) | **POST** /api-donator/donator | 


# **getDonator**
> DonatorDto getDonator(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int donatorId = 56; // int | 

try {
    final response = api.getDonator(donatorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->getDonator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 

### Return type

[**DonatorDto**](DonatorDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDonatorByToken**
> DonatorDto getDonatorByToken()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();

try {
    final response = api.getDonatorByToken();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->getDonatorByToken: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DonatorDto**](DonatorDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerDonator**
> DonatorDto registerDonator(donatorRegisterDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final DonatorRegisterDto donatorRegisterDto = ; // DonatorRegisterDto | 

try {
    final response = api.registerDonator(donatorRegisterDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->registerDonator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorRegisterDto** | [**DonatorRegisterDto**](DonatorRegisterDto.md)|  | 

### Return type

[**DonatorDto**](DonatorDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

