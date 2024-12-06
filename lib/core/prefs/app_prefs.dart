import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPrefs {
  static const String _userKey = 'user';

  static Future<void> saveUserJson({required Map<String, dynamic> json}) async {
    final prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(json);
    await prefs.setString(_userKey, data);
  }

  static Future<Map<String, dynamic>> loadUserJson() async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString(_userKey)!);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
