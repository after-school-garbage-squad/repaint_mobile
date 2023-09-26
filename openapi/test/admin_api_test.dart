import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AdminApi
void main() {
  final instance = Openapi().getAdminApi();

  group(AdminApi, () {
    // add operator
    //
    // イベントの管理者を追加する
    //
    //Future addOperation(AddOperationRequest addOperationRequest) async
    test('test addOperation', () async {
      // TODO
    });

    // check spot status by beacon hwId
    //
    // hwIdを指定してスポットを取得する
    //
    //Future<Spot> checkSpotByBeacon(String eventID, CheckSpotByBeaconRequest checkSpotByBeaconRequest) async
    test('test checkSpotByBeacon', () async {
      // TODO
    });

    // check spot status by QR code(spotId)
    //
    // QRコード(spotId)を指定してスポットを取得する
    //
    //Future<Spot> checkSpotByQR(String eventID, DropPaletteRequest dropPaletteRequest) async
    test('test checkSpotByQR', () async {
      // TODO
    });

    // check visitor image is exist
    //
    // 参加者を撮影した画像を取得する
    //
    //Future<CheckVisitorImage200Response> checkVisitorImage(String eventID, CheckVisitorImageRequest checkVisitorImageRequest) async
    test('test checkVisitorImage', () async {
      // TODO
    });

    // controll traffic
    //
    // 人流を制御する
    //
    //Future controllTraffic(String eventID, ControllTrafficRequest controllTrafficRequest) async
    test('test controllTraffic', () async {
      // TODO
    });

    // create event
    //
    // イベントを作成する
    //
    //Future<CreateEvent> createEvent(CreateEventRequest createEventRequest) async
    test('test createEvent', () async {
      // TODO
    });

    // delete default image
    //
    // デフォルトで登録されている画像を削除する
    //
    //Future deleteDefaultImage(String eventID, RegisterDefaultImageRequest registerDefaultImageRequest) async
    test('test deleteDefaultImage', () async {
      // TODO
    });

    // delete event
    //
    // イベントを削除する
    //
    //Future deleteEvent(String eventID) async
    test('test deleteEvent', () async {
      // TODO
    });

    // delete spot
    //
    // スポットを削除する
    //
    //Future deleteSpot(String eventID, DropPaletteRequest dropPaletteRequest) async
    test('test deleteSpot', () async {
      // TODO
    });

    // get event list
    //
    // 管理者に紐づくイベントの一覧を取得する
    //
    //Future<BuiltList<Event>> getEvents() async
    test('test getEvents', () async {
      // TODO
    });

    // get spot list
    //
    // スポットの一覧を取得する
    //
    //Future<BuiltList<Spot>> getSpots(String eventID) async
    test('test getSpots', () async {
      // TODO
    });

    // get traffic status
    //
    // イベントの人流を取得する
    //
    //Future<BuiltList<TrafficStatus>> getTrafficStatus(String eventID) async
    test('test getTrafficStatus', () async {
      // TODO
    });

    // register default image
    //
    // デフォルトで登録される画像を設定する
    //
    //Future registerDefaultImage(String eventID, RegisterDefaultImageRequest registerDefaultImageRequest) async
    test('test registerDefaultImage', () async {
      // TODO
    });

    // register spot
    //
    // スポットを登録する
    //
    //Future<Spot> registerSpot(String eventID, RegisterSpotRequest registerSpotRequest) async
    test('test registerSpot', () async {
      // TODO
    });

    // send email
    //
    // イベントの管理者を追加するためのメールを送信する
    //
    //Future sendEmail(String eventID, SendEmailRequest sendEmailRequest) async
    test('test sendEmail', () async {
      // TODO
    });

    // update event
    //
    // イベントを更新する
    //
    //Future<UpdateEvent> updateEvent(String eventID, CreateEventRequest createEventRequest) async
    test('test updateEvent', () async {
      // TODO
    });

    // update spot
    //
    // スポットを更新する
    //
    //Future<Spot> updateSpot(String eventID, UpdateSpotRequest updateSpotRequest) async
    test('test updateSpot', () async {
      // TODO
    });

    // upload visitor image
    //
    // 参加者を撮影した画像を登録する
    //
    //Future uploadVisitorImage(String eventID, MultipartFile image) async
    test('test uploadVisitorImage', () async {
      // TODO
    });

  });
}
