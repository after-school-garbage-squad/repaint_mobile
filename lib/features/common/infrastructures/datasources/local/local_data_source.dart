import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  LocalDataSource(
    this._preferences,
    this._logger,
  );

  final SharedPreferences _preferences;
  final Logger _logger;

  Future<void> set(String key, Map<String, dynamic> value) async {
    await _preferences.setString(key, jsonEncode(value));
    _logger.d('$key: $value');
  }

  Map<String, dynamic>? get(String key) {
    final value = _preferences.getString(key);
    _logger.d('$key: $value');
    return value != null ? jsonDecode(value) as Map<String, dynamic> : null;
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
