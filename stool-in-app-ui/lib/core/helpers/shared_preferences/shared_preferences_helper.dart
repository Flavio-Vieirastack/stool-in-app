import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferencesHelper {
  void saveInt({required String key, required int value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }
  void saveDouble({required String key, required double value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  void saveString({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  void saveBool({required String key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  void saveStringList(
      {required String key, required List<String> value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result =  prefs.getStringList(key);
    return result;
  }

  Future<int?> getInt({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }
  Future<double?> getDouble({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<String?> getString({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool?> getBool({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  void clearAllCache() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void removeCache({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}