import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../di/service_locator.dart';

@Singleton()
class SharedPrefs {
  final SharedPreferences _sharedPrefs = sl<SharedPreferences>();

  // Keys
  static const String _settingsKey = "settings_sp_key";

  // Settings
  set settings(Map<String, dynamic>? data) {
    data == null
        ? _sharedPrefs.remove(_settingsKey)
        : _sharedPrefs.setString(_settingsKey, json.encode(data));
  }

  Map<String, dynamic>? get settings {
    final jsonString = _sharedPrefs.getString(_settingsKey);
    return jsonString != null
        ? json.decode(jsonString) as Map<String, dynamic>
        : null;
  }
}
