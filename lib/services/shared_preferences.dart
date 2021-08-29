import 'package:shared_preferences/shared_preferences.dart';

class DataSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyName = 'name';

  static const _keyShowCase = 'case';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTitle(String title) async =>
      await _preferences.setString(_keyName, title);

  static String getTitle() => _preferences.getString(_keyName) == null
      ? ''
      : _preferences.getString(_keyName).toString();

  static Future setFinishShowCase(bool status) async {
    await _preferences.setBool(_keyShowCase, status);
  }

  static bool? getFinishShowCase() =>
      _preferences.getBool(_keyShowCase) ?? false;
}