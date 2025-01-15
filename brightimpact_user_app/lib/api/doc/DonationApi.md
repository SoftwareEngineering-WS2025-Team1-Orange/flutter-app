# openapi.api.DonationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**donateToNgo**](DonationApi.md#donatetongo) | **POST** /api-donator/donation/donator/{donator_id}/ngo/{ngo_id} | 
[**donateToProject**](DonationApi.md#donatetoproject) | **POST** /api-donator/donation/donator/{donator_id}/project/{project_id} | 


# **donateToNgo**
> DonateToNgo201ResponseDto donateToNgo(donatorId, ngoId, donateToNgoRequestDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationApi();
final int donatorId = 56; // int | 
final int ngoId = 56; // int | 
final DonateToNgoRequestDto donateToNgoRequestDto = ; // DonateToNgoRequestDto | 

try {
    final response = api.donateToNgo(donatorId, ngoId, donateToNgoRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonationApi->donateToNgo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **ngoId** | **int**|  | 
 **donateToNgoRequestDto** | [**DonateToNgoRequestDto**](DonateToNgoRequestDto.md)|  | 

### Return type

[**DonateToNgo201ResponseDto**](DonateToNgo201ResponseDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **donateToProject**
> DonateToProject201ResponseDto donateToProject(donatorId, projectId, donateToProjectRequestDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonationApi();
final int donatorId = 56; // int | 
final int projectId = 56; // int | 
final DonateToProjectRequestDto donateToProjectRequestDto = ; // DonateToProjectRequestDto | 

try {
    final response = api.donateToProject(donatorId, projectId, donateToProjectRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonationApi->donateToProject: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **projectId** | **int**|  | 
 **donateToProjectRequestDto** | [**DonateToProjectRequestDto**](DonateToProjectRequestDto.md)|  | 

### Return type

[**DonateToProject201ResponseDto**](DonateToProject201ResponseDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

