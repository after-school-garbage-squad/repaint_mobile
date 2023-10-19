import 'dart:convert';

import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  LocalDataSource(this._preferences);

  final SharedPreferences _preferences;
  static final Logger _logger = Logger("LocalDataSource");

  Future<void> set(String key, Map<String, dynamic> value) async {
    await _preferences.setString(key, jsonEncode(value));
    _logger.info('$key: $value');
  }

  Map<String, dynamic>? get(String key) {
    final value = _preferences.getString(key);
    _logger.info('$key: $value');
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
