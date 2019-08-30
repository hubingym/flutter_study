import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_study/common/index.dart';

class GlobalState extends ChangeNotifier {
  // 需要保存的数据转成json
  _toJson() {
    return {
      'theme': _theme.value,
      'locale': _locale,
    };
  }

  GlobalState() {
    var jsonProfile = Utils.loadProfile();
    if (jsonProfile != null) {
      var themes = <MaterialColor>[
        Colors.blue,
        Colors.cyan,
        Colors.teal,
        Colors.green,
        Colors.red,
      ];

      var profile = jsonDecode(jsonProfile);
      this._theme = themes.firstWhere((e) => e.value == profile['theme'], orElse: () => Colors.blue);
      this._locale = profile['locale'];
    } else {
      this._theme = Colors.blue;
      this._locale = '';
    }
  }

  // 保存和通知变化
  void saveAndNotify() async {
    var profile = this._toJson();
    Utils.saveProfile(jsonEncode(profile));
    notifyListeners();
  }

  // 当前用户
  String userName = '';

  // 获取当前主题
  ColorSwatch _theme;
  get theme => _theme;
  set theme(ColorSwatch color) {
    if (color != _theme) {
      _theme = color;
      saveAndNotify();
    }
  }

  Locale getLocale() {
    var t = _locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 当前语言
  String _locale;
  String get locale => _locale;
  set locale(String locale) {
    if (locale != _locale) {
      _locale = locale;
      saveAndNotify();
    }
  }
}
