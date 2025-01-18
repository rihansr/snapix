import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../di/service_locator.dart';

@Singleton()
class SharedPrefs {
  final SharedPreferences _sharedPrefs = sl<SharedPreferences>();
}
