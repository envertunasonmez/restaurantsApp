import 'package:hive_flutter/hive_flutter.dart';

class AppCache {
  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox('AppBox');
    }
  }

  static Future<void> addValue(
      {required String key, required dynamic value}) async {
    _box?.put(key, value);
  }

  static dynamic getValue({required String key}) {
    return _box?.get(key, defaultValue: null);
  }

  static void clearCache() async {
    _box?.clear();
  }
  static void logOut() async {
    _box?.delete('token');
  }
}
