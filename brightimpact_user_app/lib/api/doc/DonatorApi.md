# openapi.api.DonatorApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**donatorDonatorIdGet**](DonatorApi.md#donatordonatoridget) | **GET** /donator/{donator_id} | 
[**donatorMeGet**](DonatorApi.md#donatormeget) | **GET** /donator/me | 
[**donatorPost**](DonatorApi.md#donatorpost) | **POST** /donator | 


# **donatorDonatorIdGet**
> DonatorDto donatorDonatorIdGet(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int donatorId = 56; // int | 

try {
    final response = api.donatorDonatorIdGet(donatorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->donatorDonatorIdGet: $e\n');
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

# **donatorMeGet**
> DonatorDto donatorMeGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();

try {
    final response = api.donatorMeGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->donatorMeGet: $e\n');
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

# **donatorPost**
> int donatorPost(donatorRegisterDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final DonatorRegisterDto donatorRegisterDto = ; // DonatorRegisterDto | 

try {
    final response = api.donatorPost(donatorRegisterDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->donatorPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorRegisterDto** | [**DonatorRegisterDto**](DonatorRegisterDto.md)|  | 

### Return type

**int**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

