# openapi.api.VisitorApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3003*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteVisitor**](VisitorApi.md#deletevisitor) | **DELETE** /visitor/{visitorID}/event/{eventID}/delete | delete visitor
[**dropPalette**](VisitorApi.md#droppalette) | **POST** /visitor/{visitorID}/event/{eventID}/palette/drop | drop palette
[**getCurrentImage**](VisitorApi.md#getcurrentimage) | **GET** /visitor/{visitorID}/event/{eventID}/image/get-current | get current image
[**getVisitorImages**](VisitorApi.md#getvisitorimages) | **GET** /visitor/{visitorID}/event/{eventID}/image/list | get visitor image list
[**initializeVisitor**](VisitorApi.md#initializevisitor) | **PATCH** /visitor/{visitorID}/event/{eventID}/initialize | initialize visitor(Second and subsequent startups)
[**joinEvent**](VisitorApi.md#joinevent) | **POST** /visitor/event/{eventID}/join | join event
[**pickPalette**](VisitorApi.md#pickpalette) | **POST** /visitor/{visitorID}/event/{eventID}/palette/pick | pick palette
[**setCurrentImage**](VisitorApi.md#setcurrentimage) | **POST** /visitor/{visitorID}/event/{eventID}/image/set-current | set current image


# **deleteVisitor**
> deleteVisitor(visitorID, eventID)

delete visitor

参加者を削除する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    api.deleteVisitor(visitorID, eventID);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->deleteVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **dropPalette**
> dropPalette(visitorID, eventID, dropPaletteRequest)

drop palette

paletteをdropする

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID
final DropPaletteRequest dropPaletteRequest = ; // DropPaletteRequest | 

try {
    api.dropPalette(visitorID, eventID, dropPaletteRequest);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->dropPalette: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 
 **dropPaletteRequest** | [**DropPaletteRequest**](DropPaletteRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCurrentImage**
> GetCurrentImage200Response getCurrentImage(visitorID, eventID)

get current image

参加者が現在設定している写真を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    final response = api.getCurrentImage(visitorID, eventID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->getCurrentImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 

### Return type

[**GetCurrentImage200Response**](GetCurrentImage200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getVisitorImages**
> BuiltList<String> getVisitorImages(visitorID, eventID)

get visitor image list

参加者に紐づく写真の一覧を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    final response = api.getVisitorImages(visitorID, eventID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->getVisitorImages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 

### Return type

**BuiltList&lt;String&gt;**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initializeVisitor**
> InitializeVisitor200Response initializeVisitor(visitorID, eventID, joinEventRequest)

initialize visitor(Second and subsequent startups)

参加者を初期化する(二回目以降の起動時)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID
final JoinEventRequest joinEventRequest = ; // JoinEventRequest | 

try {
    final response = api.initializeVisitor(visitorID, eventID, joinEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->initializeVisitor: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 
 **joinEventRequest** | [**JoinEventRequest**](JoinEventRequest.md)|  | 

### Return type

[**InitializeVisitor200Response**](InitializeVisitor200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **joinEvent**
> JoinEvent200Response joinEvent(eventID, joinEventRequest)

join event

イベントに参加する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final JoinEventRequest joinEventRequest = ; // JoinEventRequest | 

try {
    final response = api.joinEvent(eventID, joinEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->joinEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **joinEventRequest** | [**JoinEventRequest**](JoinEventRequest.md)|  | 

### Return type

[**JoinEvent200Response**](JoinEvent200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pickPalette**
> pickPalette(visitorID, eventID, dropPaletteRequest)

pick palette

paletteをpickする

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID
final DropPaletteRequest dropPaletteRequest = ; // DropPaletteRequest | 

try {
    api.pickPalette(visitorID, eventID, dropPaletteRequest);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->pickPalette: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 
 **dropPaletteRequest** | [**DropPaletteRequest**](DropPaletteRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCurrentImage**
> setCurrentImage(visitorID, eventID, image)

set current image

参加者の画像を設定する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getVisitorApi();
final String visitorID = visitorID_example; // String | 参加者のパブリックID
final String eventID = eventID_example; // String | イベントのパブリックID
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 画像ファイル

try {
    api.setCurrentImage(visitorID, eventID, image);
} catch on DioException (e) {
    print('Exception when calling VisitorApi->setCurrentImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **visitorID** | **String**| 参加者のパブリックID | 
 **eventID** | **String**| イベントのパブリックID | 
 **image** | **MultipartFile**| 画像ファイル | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

