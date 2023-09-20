import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for VisitorApi
void main() {
  final instance = Openapi().getVisitorApi();

  group(VisitorApi, () {
    // delete visitor
    //
    // 参加者を削除する
    //
    //Future deleteVisitor(String visitorID, String eventID) async
    test('test deleteVisitor', () async {
      // TODO
    });

    // drop palette
    //
    // paletteをdropする
    //
    //Future dropPalette(String visitorID, String eventID, DropPaletteRequest dropPaletteRequest) async
    test('test dropPalette', () async {
      // TODO
    });

    // get current image
    //
    // 参加者が現在設定している写真を取得する
    //
    //Future<GetCurrentImage200Response> getCurrentImage(String visitorID, String eventID) async
    test('test getCurrentImage', () async {
      // TODO
    });

    // get visitor image list
    //
    // 参加者に紐づく写真の一覧を取得する
    //
    //Future<BuiltList<String>> getVisitorImages(String visitorID, String eventID) async
    test('test getVisitorImages', () async {
      // TODO
    });

    // initialize visitor(Second and subsequent startups)
    //
    // 参加者を初期化する(二回目以降の起動時)
    //
    //Future<InitializeVisitor200Response> initializeVisitor(String visitorID, String eventID, JoinEventRequest joinEventRequest) async
    test('test initializeVisitor', () async {
      // TODO
    });

    // join event
    //
    // イベントに参加する
    //
    //Future<JoinEvent200Response> joinEvent(String eventID, JoinEventRequest joinEventRequest) async
    test('test joinEvent', () async {
      // TODO
    });

    // pick palette
    //
    // paletteをpickする
    //
    //Future pickPalette(String visitorID, String eventID, DropPaletteRequest dropPaletteRequest) async
    test('test pickPalette', () async {
      // TODO
    });

    // set current image
    //
    // 参加者の画像を設定する
    //
    //Future setCurrentImage(String visitorID, String eventID, MultipartFile image) async
    test('test setCurrentImage', () async {
      // TODO
    });

  });
}
