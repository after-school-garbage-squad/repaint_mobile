# openapi.api.AdminApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3003*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addOperation**](AdminApi.md#addoperation) | **POST** /admin/add-operator | add operator
[**checkSpotByBeacon**](AdminApi.md#checkspotbybeacon) | **GET** /admin/event/{eventID}/spot/check-by-beacon | check spot status by beacon hwId
[**checkSpotByQR**](AdminApi.md#checkspotbyqr) | **GET** /admin/event/{eventID}/spot/check-by-qr | check spot status by QR code(spotId)
[**checkVisitorImage**](AdminApi.md#checkvisitorimage) | **GET** /admin/event/{eventID}/image/check-visitor | check visitor image is exist
[**controllTraffic**](AdminApi.md#controlltraffic) | **POST** /admin/event/{eventID}/traffic/controll | controll traffic
[**createEvent**](AdminApi.md#createevent) | **POST** /admin/event/create | create event
[**deleteDefaultImage**](AdminApi.md#deletedefaultimage) | **DELETE** /admin/event/{eventID}/image/delete-default | delete default image
[**deleteEvent**](AdminApi.md#deleteevent) | **DELETE** /admin/event/{eventID}/delete | delete event
[**deleteSpot**](AdminApi.md#deletespot) | **DELETE** /admin/event/{eventID}/spot/delete | delete spot
[**getEvents**](AdminApi.md#getevents) | **GET** /admin/event/list | get event list
[**getSpots**](AdminApi.md#getspots) | **GET** /admin/event/{eventID}/spot/list | get spot list
[**getTrafficStatus**](AdminApi.md#gettrafficstatus) | **GET** /admin/event/{eventID}/traffic/get-status | get traffic status
[**registerDefaultImage**](AdminApi.md#registerdefaultimage) | **POST** /admin/event/{eventID}/image/register-default | register default image
[**registerSpot**](AdminApi.md#registerspot) | **POST** /admin/event/{eventID}/spot/register | register spot
[**sendEmail**](AdminApi.md#sendemail) | **POST** /admin/event/{eventID}/send-email | send email
[**updateEvent**](AdminApi.md#updateevent) | **PATCH** /admin/event/{eventID}/update | update event
[**updateSpot**](AdminApi.md#updatespot) | **PATCH** /admin/event/{eventID}/spot/update | update spot
[**uploadVisitorImage**](AdminApi.md#uploadvisitorimage) | **POST** /admin/event/{eventID}/image/upload-visitor | upload visitor image


# **addOperation**
> addOperation(addOperationRequest)

add operator

イベントの管理者を追加する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final AddOperationRequest addOperationRequest = ; // AddOperationRequest | 

try {
    api.addOperation(addOperationRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->addOperation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addOperationRequest** | [**AddOperationRequest**](AddOperationRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkSpotByBeacon**
> Spot checkSpotByBeacon(eventID, checkSpotByBeaconRequest)

check spot status by beacon hwId

hwIdを指定してスポットを取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final CheckSpotByBeaconRequest checkSpotByBeaconRequest = ; // CheckSpotByBeaconRequest | 

try {
    final response = api.checkSpotByBeacon(eventID, checkSpotByBeaconRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->checkSpotByBeacon: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **checkSpotByBeaconRequest** | [**CheckSpotByBeaconRequest**](CheckSpotByBeaconRequest.md)|  | 

### Return type

[**Spot**](Spot.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkSpotByQR**
> Spot checkSpotByQR(eventID, dropPaletteRequest)

check spot status by QR code(spotId)

QRコード(spotId)を指定してスポットを取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final DropPaletteRequest dropPaletteRequest = ; // DropPaletteRequest | 

try {
    final response = api.checkSpotByQR(eventID, dropPaletteRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->checkSpotByQR: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **dropPaletteRequest** | [**DropPaletteRequest**](DropPaletteRequest.md)|  | 

### Return type

[**Spot**](Spot.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkVisitorImage**
> CheckVisitorImage200Response checkVisitorImage(eventID, checkVisitorImageRequest)

check visitor image is exist

参加者を撮影した画像を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final CheckVisitorImageRequest checkVisitorImageRequest = ; // CheckVisitorImageRequest | 

try {
    final response = api.checkVisitorImage(eventID, checkVisitorImageRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->checkVisitorImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **checkVisitorImageRequest** | [**CheckVisitorImageRequest**](CheckVisitorImageRequest.md)|  | 

### Return type

[**CheckVisitorImage200Response**](CheckVisitorImage200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **controllTraffic**
> controllTraffic(eventID, controllTrafficRequest)

controll traffic

人流を制御する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final ControllTrafficRequest controllTrafficRequest = ; // ControllTrafficRequest | 

try {
    api.controllTraffic(eventID, controllTrafficRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->controllTraffic: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **controllTrafficRequest** | [**ControllTrafficRequest**](ControllTrafficRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEvent**
> CreateEvent createEvent(createEventRequest)

create event

イベントを作成する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final CreateEventRequest createEventRequest = ; // CreateEventRequest | 

try {
    final response = api.createEvent(createEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->createEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createEventRequest** | [**CreateEventRequest**](CreateEventRequest.md)|  | 

### Return type

[**CreateEvent**](CreateEvent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDefaultImage**
> deleteDefaultImage(eventID, registerDefaultImageRequest)

delete default image

デフォルトで登録されている画像を削除する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final RegisterDefaultImageRequest registerDefaultImageRequest = ; // RegisterDefaultImageRequest | 

try {
    api.deleteDefaultImage(eventID, registerDefaultImageRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->deleteDefaultImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **registerDefaultImageRequest** | [**RegisterDefaultImageRequest**](RegisterDefaultImageRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEvent**
> deleteEvent(eventID)

delete event

イベントを削除する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    api.deleteEvent(eventID);
} catch on DioException (e) {
    print('Exception when calling AdminApi->deleteEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSpot**
> deleteSpot(eventID, dropPaletteRequest)

delete spot

スポットを削除する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final DropPaletteRequest dropPaletteRequest = ; // DropPaletteRequest | 

try {
    api.deleteSpot(eventID, dropPaletteRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->deleteSpot: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **dropPaletteRequest** | [**DropPaletteRequest**](DropPaletteRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEvents**
> BuiltList<Event> getEvents()

get event list

管理者に紐づくイベントの一覧を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();

try {
    final response = api.getEvents();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->getEvents: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;Event&gt;**](Event.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSpots**
> BuiltList<Spot> getSpots(eventID)

get spot list

スポットの一覧を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    final response = api.getSpots(eventID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->getSpots: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 

### Return type

[**BuiltList&lt;Spot&gt;**](Spot.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTrafficStatus**
> BuiltList<TrafficStatus> getTrafficStatus(eventID)

get traffic status

イベントの人流を取得する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID

try {
    final response = api.getTrafficStatus(eventID);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->getTrafficStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 

### Return type

[**BuiltList&lt;TrafficStatus&gt;**](TrafficStatus.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerDefaultImage**
> registerDefaultImage(eventID, registerDefaultImageRequest)

register default image

デフォルトで登録される画像を設定する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final RegisterDefaultImageRequest registerDefaultImageRequest = ; // RegisterDefaultImageRequest | 

try {
    api.registerDefaultImage(eventID, registerDefaultImageRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->registerDefaultImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **registerDefaultImageRequest** | [**RegisterDefaultImageRequest**](RegisterDefaultImageRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerSpot**
> Spot registerSpot(eventID, registerSpotRequest)

register spot

スポットを登録する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final RegisterSpotRequest registerSpotRequest = ; // RegisterSpotRequest | 

try {
    final response = api.registerSpot(eventID, registerSpotRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->registerSpot: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **registerSpotRequest** | [**RegisterSpotRequest**](RegisterSpotRequest.md)|  | 

### Return type

[**Spot**](Spot.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendEmail**
> sendEmail(eventID, sendEmailRequest)

send email

イベントの管理者を追加するためのメールを送信する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final SendEmailRequest sendEmailRequest = ; // SendEmailRequest | 

try {
    api.sendEmail(eventID, sendEmailRequest);
} catch on DioException (e) {
    print('Exception when calling AdminApi->sendEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **sendEmailRequest** | [**SendEmailRequest**](SendEmailRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEvent**
> UpdateEvent updateEvent(eventID, createEventRequest)

update event

イベントを更新する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final CreateEventRequest createEventRequest = ; // CreateEventRequest | 

try {
    final response = api.updateEvent(eventID, createEventRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->updateEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **createEventRequest** | [**CreateEventRequest**](CreateEventRequest.md)|  | 

### Return type

[**UpdateEvent**](UpdateEvent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSpot**
> Spot updateSpot(eventID, updateSpotRequest)

update spot

スポットを更新する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final UpdateSpotRequest updateSpotRequest = ; // UpdateSpotRequest | 

try {
    final response = api.updateSpot(eventID, updateSpotRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AdminApi->updateSpot: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **updateSpotRequest** | [**UpdateSpotRequest**](UpdateSpotRequest.md)|  | 

### Return type

[**Spot**](Spot.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uploadVisitorImage**
> uploadVisitorImage(eventID, image)

upload visitor image

参加者を撮影した画像を登録する

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminApi();
final String eventID = eventID_example; // String | イベントのパブリックID
final MultipartFile image = BINARY_DATA_HERE; // MultipartFile | 画像ファイル

try {
    api.uploadVisitorImage(eventID, image);
} catch on DioException (e) {
    print('Exception when calling AdminApi->uploadVisitorImage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventID** | **String**| イベントのパブリックID | 
 **image** | **MultipartFile**| 画像ファイル | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

