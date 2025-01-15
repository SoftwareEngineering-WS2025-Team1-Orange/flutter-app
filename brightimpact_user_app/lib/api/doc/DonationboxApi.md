# openapi.api.DonationboxApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDonationbox**](DonationboxApi.md#getdonationbox) | **GET** /api-donator/donationbox/donator/{donator_id} | 
[**registerDonationbox**](DonationboxApi.md#registerdonationbox) | **PUT** /api-donator/donationbox/donator/{donator_id} | 
[**sendConfig**](DonationboxApi.md#sendconfig) | **POST** /api-donationbox/sendConfig | 
[**sendStatusUpdateRequest**](DonationboxApi.md#sendstatusupdaterequest) | **POST** /api-donationbox/sendStatusUpdateRequest | 


# **getDonationbox**
> List<DonationboxDto> getDonationbox(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationboxApi();
final int donatorId = 56; // int | 

try {
    final response = api.getDonationbox(donatorId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonationboxApi->getDonationbox: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 

### Return type

[**List&lt;DonationboxDto&gt;**](DonationboxDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerDonationbox**
> registerDonationbox(donatorId, donationboxRegisterDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationboxApi();
final int donatorId = 56; // int | 
final DonationboxRegisterDto donationboxRegisterDto = ; // DonationboxRegisterDto | 

try {
    api.registerDonationbox(donatorId, donationboxRegisterDto);
} catch on DioException (e) {
    print('Exception when calling DonationboxApi->registerDonationbox: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **donationboxRegisterDto** | [**DonationboxRegisterDto**](DonationboxRegisterDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendConfig**
> sendConfig(donationboxSendConfigDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationboxApi();
final DonationboxSendConfigDto donationboxSendConfigDto = ; // DonationboxSendConfigDto | 

try {
    api.sendConfig(donationboxSendConfigDto);
} catch on DioException (e) {
    print('Exception when calling DonationboxApi->sendConfig: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donationboxSendConfigDto** | [**DonationboxSendConfigDto**](DonationboxSendConfigDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendStatusUpdateRequest**
> sendStatusUpdateRequest(sendStatusUpdateRequestRequestDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationboxApi();
final SendStatusUpdateRequestRequestDto sendStatusUpdateRequestRequestDto = ; // SendStatusUpdateRequestRequestDto | 

try {
    api.sendStatusUpdateRequest(sendStatusUpdateRequestRequestDto);
} catch on DioException (e) {
    print('Exception when calling DonationboxApi->sendStatusUpdateRequest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sendStatusUpdateRequestRequestDto** | [**SendStatusUpdateRequestRequestDto**](SendStatusUpdateRequestRequestDto.md)|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

