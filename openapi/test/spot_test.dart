import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for Spot
void main() {
  final instance = SpotBuilder();
  // TODO add properties to the builder and call build()

  group(Spot, () {
    // スポットのパブリックID(ulid)
    // String spotID
    test('to test the property `spotID`', () async {
      // TODO
    });

    // スポット名
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // pickableなスポットかどうか
    // bool isPick
    test('to test the property `isPick`', () async {
      // TODO
    });

    // スポットのステータスがボーナスかどうか
    // bool bonus
    test('to test the property `bonus`', () async {
      // TODO
    });

    // IBeacon iBeacon
    test('to test the property `iBeacon`', () async {
      // TODO
    });

    // ビーコンのハードウェアID
    // String hwId
    test('to test the property `hwId`', () async {
      // TODO
    });

    // ビーコンのサービスUUID
    // String serviceUuid
    test('to test the property `serviceUuid`', () async {
      // TODO
    });

  });
}
