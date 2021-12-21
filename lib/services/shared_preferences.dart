import 'package:shared_preferences/shared_preferences.dart';

class DataSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyName = 'name';

  static const _keyShowCase = 'case';

  static const _keyFirstLaunchAR = 'AR';

  static const _keyQuizCase = 'quiz case';

  static const _keyUnlockQuiz = 'unlock quiz';

  static const _keyUnlockQuiz3 = 'quiz3';

  static const _keyUnlockQuiz4 = 'quiz4';

  static const _keyQuizTracking = 'quiz tracking';

  static const _keyFirstQuizCompletion = 'quiz one completion';

  static const _keySecondQuizCompletion = 'quiz two completion';

  static const _keyThirdQuizCompletion = 'quiz third completion';

  static const _keyFourthQuizCompletion = 'quiz fourth completion';

  static const _keyFirstTimeResult = 'result';

  static const _keyDuration = 'dur';

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

  static Future setFirstLaunchAR(bool status) async {
    await _preferences.setBool(_keyFirstLaunchAR, status);
  }

  static bool? getFirstLaunchAR() =>
      _preferences.getBool(_keyFirstLaunchAR) ?? false;

  static Future setFirstTimeQuiz(bool status) async {
    await _preferences.setBool(_keyQuizCase, status);
  }

  /// wheter the user already try the quiz for the first time or not
  static bool? getFirstTimeQuiz() => _preferences.getBool(_keyQuizCase) ?? true;

  static Future setFirstTimeResult(bool status) async {
    await _preferences.setBool(_keyFirstTimeResult, status);
  }

  /// wheter the user already see the result for the first time or not
  static bool? getFirstTimeResult() =>
      _preferences.getBool(_keyFirstTimeResult) ?? true;

  static Future setQuizTwoUnlocked(bool status) async {
    await _preferences.setBool(_keyUnlockQuiz, status);
  }

  /// wheter the second quiz has unlocked or not
  static bool? getQuizTwoUnlocked() =>
      _preferences.getBool(_keyUnlockQuiz) ?? false;

  static Future setQuizThreeUnlocked(bool status) async {
    await _preferences.setBool(_keyUnlockQuiz3, status);
  }

  /// wheter the third quiz has unlocked or not
  static bool getQuizThreeUnlocked() =>
      _preferences.getBool(_keyUnlockQuiz3) ?? false;

  static Future setQuizFourthUnlocked(bool status) async {
    await _preferences.setBool(_keyUnlockQuiz4, status);
  }

  /// wheter the 4th quiz has unlocked or not
  static bool getQuizFourthUnlocked() =>
      _preferences.getBool(_keyUnlockQuiz4) ?? false;

  static Future setQuizTracking(List<int> total) async {
    final quizTracking = total.map((mark) => mark.toString()).toList();
    return _preferences.setStringList(_keyQuizTracking, quizTracking);
  }

  /// track a score everytime practice the quiz
  static List<int> getQuizTracking() =>
      _preferences
          .getStringList(_keyQuizTracking)
          ?.map((e) => int.parse(e))
          .toList() ??
      [];

  static Future setFirstQuizCompletion(List<int> allNumber) async {
    final block = allNumber.map((mark) => mark.toString()).toList();
    return _preferences.setStringList(_keyFirstQuizCompletion, block);
  }

  /// return an array of point of every question
  static List<int> getFirstQuizCompletion() =>
      _preferences
          .getStringList(_keyFirstQuizCompletion)
          ?.map((e) => int.parse(e))
          .toList() ??
      [
        0,
        0,
        0,
        0,
        0,
      ];
  static Future setSecondQuizCompletion(List<int> allNumber) async {
    final block = allNumber.map((mark) => mark.toString()).toList();
    return _preferences.setStringList(_keySecondQuizCompletion, block);
  }

  /// return an array of point of every question
  static List<int> getSecondQuizCompletion() =>
      _preferences
          .getStringList(_keySecondQuizCompletion)
          ?.map((e) => int.parse(e))
          .toList() ??
      [
        0,
        0,
        0,
        0,
        0,
      ];

  static Future setThirdQuizCompletion(List<int> allNumber) async {
    final block = allNumber.map((mark) => mark.toString()).toList();
    return _preferences.setStringList(_keyThirdQuizCompletion, block);
  }

  /// return an array of score of every block question
  static List<int> getThirdQuizCompletion() =>
      _preferences
          .getStringList(_keyThirdQuizCompletion)
          ?.map((e) => int.parse(e))
          .toList() ??
      [
        0,
        0,
        0,
        0,
        0,
      ];

  static Future setFourthQuizCompletion(List<int> allNumber) async {
    final block = allNumber.map((mark) => mark.toString()).toList();
    return _preferences.setStringList(_keyFourthQuizCompletion, block);
  }

  /// return an array of score of every block question
  static List<int> getFourthQuizCompletion() =>
      _preferences
          .getStringList(_keyFourthQuizCompletion)
          ?.map((e) => int.parse(e))
          .toList() ??
      [
        0,
        0,
        0,
        0,
        0,
      ];

  static Future<void> setArUiDuration(int duration) async {
    await _preferences.setInt(_keyDuration, duration);
  }

  static int getArUiDuration() {
    return _preferences.getInt(_keyDuration) ?? 5;
  }
}
