# openapi.api.DonatorApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteDonator**](DonatorApi.md#deletedonator) | **DELETE** /api-donator/donator/{donator_id} | 
[**favoriteNgo**](DonatorApi.md#favoritengo) | **PUT** /api-donator/ngo/{ngo_id}/donator/{donator_id}/favorite | 
[**favoriteProject**](DonatorApi.md#favoriteproject) | **PUT** /api-donator/project/{project_id}/donator/{donator_id}/favorite | 
[**getDonator**](DonatorApi.md#getdonator) | **GET** /api-donator/donator/{donator_id} | 
[**getDonatorByToken**](DonatorApi.md#getdonatorbytoken) | **GET** /api-donator/donator/me | 
[**registerDonator**](DonatorApi.md#registerdonator) | **POST** /api-donator/donator | 
[**updateDonator**](DonatorApi.md#updatedonator) | **PUT** /api-donator/donator/{donator_id} | 


# **deleteDonator**
> deleteDonator(donatorId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int donatorId = 56; // int | 

try {
    api.deleteDonator(donatorId);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->deleteDonator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **favoriteNgo**
> NGODto favoriteNgo(ngoId, donatorId, favoriteProjectRequestDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int ngoId = 56; // int | 
final int donatorId = 56; // int | 
final FavoriteProjectRequestDto favoriteProjectRequestDto = ; // FavoriteProjectRequestDto | 

try {
    final response = api.favoriteNgo(ngoId, donatorId, favoriteProjectRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->favoriteNgo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ngoId** | **int**|  | 
 **donatorId** | **int**|  | 
 **favoriteProjectRequestDto** | [**FavoriteProjectRequestDto**](FavoriteProjectRequestDto.md)|  | 

### Return type

[**NGODto**](NGODto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **favoriteProject**
> ProjectDto favoriteProject(projectId, donatorId, favoriteProjectRequestDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int projectId = 56; // int | 
final int donatorId = 56; // int | 
final FavoriteProjectRequestDto favoriteProjectRequestDto = ; // FavoriteProjectRequestDto | 

try {
    final response = api.favoriteProject(projectId, donatorId, favoriteProjectRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->favoriteProject: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **projectId** | **int**|  | 
 **donatorId** | **int**|  | 
 **favoriteProjectRequestDto** | [**FavoriteProjectRequestDto**](FavoriteProjectRequestDto.md)|  | 

### Return type

[**ProjectDto**](ProjectDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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
> int registerDonator(donatorRegisterDto)



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

**int**

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDonator**
> DonatorDto updateDonator(donatorId, donatorUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getDonatorApi();
final int donatorId = 56; // int | 
final DonatorUpdateDto donatorUpdateDto = ; // DonatorUpdateDto | 

try {
    final response = api.updateDonator(donatorId, donatorUpdateDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DonatorApi->updateDonator: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **donatorUpdateDto** | [**DonatorUpdateDto**](DonatorUpdateDto.md)|  | 

### Return type

[**DonatorDto**](DonatorDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

