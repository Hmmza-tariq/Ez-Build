import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  MySharedPref._();

  static late SharedPreferences _sharedPreferences;

  static const String _fcmTokenKey = 'fcm_token';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _urduKey = 'is_lang_urdu';
  static const String _location = 'my_location';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true;

  static Future<void> setIsUrdu(bool isUrdu) =>
      _sharedPreferences.setBool(_urduKey, isUrdu);

  static bool getIsUrdu() => _sharedPreferences.getBool(_urduKey) ?? false;

  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  static Future<void> clear() async => await _sharedPreferences.clear();

  static Future<void> setLocation(String value) async =>
      await _sharedPreferences.setString(_location, value);

  static String? getLocation() =>
      _sharedPreferences.getString(_location) ?? 'location';
}
