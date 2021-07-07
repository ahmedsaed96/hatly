import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
class CacheHelper {
  static SharedPreferences? preferences;
  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static dynamic getAnyValue({required String key}) {
    return preferences!.get(key);
  }

  static String? getString({required String key}) {
    return preferences!.getString(key);
  }

  static bool? getbool({required String key}) {
    return preferences!.getBool(key);
  }

  static Future<bool> setAnyValue({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return preferences!.setBool(key, value);
    } else if (value is double) {
      return preferences!.setDouble(key, value);
    } else if (value is int) {
      return preferences!.setInt(key, value);
    }
    return preferences!.setString(key, value.toString());
  }

  static void deleteData(String key) {
    preferences!.remove(key);
  }
}
