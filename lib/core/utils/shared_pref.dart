import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

Future<void> initSharedPrefernce() async {
  prefs = await SharedPreferences.getInstance();
}

Future<void> setToSharedPreference(
    {required String key, required String token}) async {
  await prefs.setString(key, token);
}
