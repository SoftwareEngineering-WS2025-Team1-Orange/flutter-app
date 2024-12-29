# openapi.api.ProjectApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://localhost:9000/api/v1/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getProjectList**](ProjectApi.md#getprojectlist) | **GET** /project | 


# **getProjectList**
> GetProjectList200ResponseDto getProjectList(donatorId, filterProjectId, filterCategory, filterIsFavorite, filterNameContains, filterIncludeArchived, filterDonatedTo, paginationPage, paginationPageSize, filterNgoId, filterNgoNameContains, sortFor, sortType)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2PasswordBearer
//defaultApiClient.getAuthentication<OAuth>('OAuth2PasswordBearer').accessToken = 'YOUR_ACCESS_TOKEN';

final api = Openapi().getProjectApi();
final int donatorId = 56; // int | 
final int filterProjectId = 56; // int | 
final ProjectCategoryDto filterCategory = ; // ProjectCategoryDto | 
final bool filterIsFavorite = true; // bool | 
final String filterNameContains = filterNameContains_example; // String | 
final bool filterIncludeArchived = true; // bool | 
final bool filterDonatedTo = true; // bool | 
final int paginationPage = 56; // int | 
final int paginationPageSize = 56; // int | 
final int filterNgoId = 56; // int | 
final String filterNgoNameContains = filterNgoNameContains_example; // String | 
final String sortFor = sortFor_example; // String | The field to sort by
final SortTypeDto sortType = ; // SortTypeDto | 

try {
    final response = api.getProjectList(donatorId, filterProjectId, filterCategory, filterIsFavorite, filterNameContains, filterIncludeArchived, filterDonatedTo, paginationPage, paginationPageSize, filterNgoId, filterNgoNameContains, sortFor, sortType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ProjectApi->getProjectList: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **donatorId** | **int**|  | 
 **filterProjectId** | **int**|  | [optional] 
 **filterCategory** | [**ProjectCategoryDto**](.md)|  | [optional] 
 **filterIsFavorite** | **bool**|  | [optional] 
 **filterNameContains** | **String**|  | [optional] 
 **filterIncludeArchived** | **bool**|  | [optional] 
 **filterDonatedTo** | **bool**|  | [optional] 
 **paginationPage** | **int**|  | [optional] [default to 1]
 **paginationPageSize** | **int**|  | [optional] [default to 20]
 **filterNgoId** | **int**|  | [optional] 
 **filterNgoNameContains** | **String**|  | [optional] 
 **sortFor** | **String**| The field to sort by | [optional] 
 **sortType** | [**SortTypeDto**](.md)|  | [optional] 

### Return type

[**GetProjectList200ResponseDto**](GetProjectList200ResponseDto.md)

### Authorization

[OAuth2PasswordBearer](../README.md#OAuth2PasswordBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

