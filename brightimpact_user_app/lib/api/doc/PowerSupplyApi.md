# openapi.api.PowerSupplyApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**donatorDonatorIdPowersupplyGet**](PowerSupplyApi.md#donatordonatoridpowersupplyget) | **GET** /donator/{donator_id}/powersupply | 
[**donatorDonatorIdPowersupplyPost**](PowerSupplyApi.md#donatordonatoridpowersupplypost) | **POST** /donator/{donator_id}/powersupply | 


# **donatorDonatorIdPowersupplyGet**
> List<PowerSupplyDto> donatorDonatorIdPowersupplyGet(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getPowerSupplyApi();
final int donatorId = 56; // int | 

try {
    final response = api.donatorDonatorIdPowersupplyGet(donatorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PowerSupplyApi->donatorDonatorIdPowersupplyGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 

### Return type

[**List&lt;PowerSupplyDto&gt;**](PowerSupplyDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **donatorDonatorIdPowersupplyPost**
> donatorDonatorIdPowersupplyPost(donatorId, powerSupplyRegisterDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getPowerSupplyApi();
final int donatorId = 56; // int | 
final PowerSupplyRegisterDto powerSupplyRegisterDto = ; // PowerSupplyRegisterDto | 

try {
    api.donatorDonatorIdPowersupplyPost(donatorId, powerSupplyRegisterDto);
} catch on DioException (e) {
    print('Exception when calling PowerSupplyApi->donatorDonatorIdPowersupplyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **powerSupplyRegisterDto** | [**PowerSupplyRegisterDto**](PowerSupplyRegisterDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

