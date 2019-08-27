import 'package:flutter/material.dart';
import 'package:flutter_study/i10n/localization_intl.dart';
import 'package:flutter_study/states/index.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var globalState = Provider.of<GlobalState>(context);
    Widget _buildLanguageItem(String lan, value) {
      bool isCurrent = globalState.locale == value;
      return ListTile(
        title: Text(
          lan,
          style: TextStyle(color: isCurrent ? color : null)
        ),
        trailing: isCurrent ? Icon(Icons.done, color: color) : null,
        onTap: () {
          globalState.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).language),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageItem("中文简体", "zh_CN"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem(AppLocalizations.of(context).auto, ''),
        ],
      ),
    );
  }
}
