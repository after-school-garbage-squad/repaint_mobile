import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    // register admin
    //
    // 管理者を作成し、システムに登録する
    //
    //Future register(RegisterRequest registerRequest) async
    test('test register', () async {
      // TODO
    });

  });
}
