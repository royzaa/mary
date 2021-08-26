import 'package:shared_preferences/shared_preferences.dart';

class DataSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyName = 'name';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTitle(String title) async =>
      await _preferences.setString(_keyName, title);

  static String getTitle() => _preferences.getString(_keyName) == null
      ? ''
      : _preferences.getString(_keyName).toString();
}
