# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://api.github.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**gitignoreTemplatesGet**](DefaultApi.md#gitignoretemplatesget) | **GET** /gitignore/templates | 
[**gitignoreTemplatesNameGet**](DefaultApi.md#gitignoretemplatesnameget) | **GET** /gitignore/templates/{name} | 


# **gitignoreTemplatesGet**
> BuiltList<String> gitignoreTemplatesGet()



### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try { 
    final response = api.gitignoreTemplatesGet();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->gitignoreTemplatesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**BuiltList&lt;String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **gitignoreTemplatesNameGet**
> InlineResponse200 gitignoreTemplatesNameGet(name)



### Example 
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();
final String name = name_example; // String | 

try { 
    final response = api.gitignoreTemplatesNameGet(name);
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->gitignoreTemplatesNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

