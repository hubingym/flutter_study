import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class Utils {
  static SharedPreferences _prefs;
  static Future initSystem() async {
    _prefs = await SharedPreferences.getInstance();
  }
  static loadProfile() {
    return _prefs.getString("profile");
  }
  static saveProfile(String jsonProfile) {
    _prefs.setString("profile", jsonProfile);
  }
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static bool get isIos => defaultTargetPlatform == TargetPlatform.iOS;
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
}
