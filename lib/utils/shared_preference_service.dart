import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  SharedPreferenceService._();

  static late SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async{
       return await preferences.setString(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await preferences.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    return await preferences.setDouble(key, value);
  }

  static String getString(String key) {
    return preferences.getString(key) ?? '';
  }

  static bool getBool(String key) {
    return preferences.getBool(key) ?? false;
  }

  static int getInt(String key) {
    return preferences.getInt(key) ?? 0;
  }

  static double? getDouble(String key) {
    return preferences.getDouble(key);
  }

  static Future<bool> remove(String key) async {
    return await preferences.remove(key);
  }

  static Future<bool> clear() async {
    return await preferences.clear();
  }

  static bool containKeys(String key) {
   return preferences.containsKey(key);
  }

}