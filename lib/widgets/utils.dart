import 'package:flutter/material.dart';
import 'package:flutter_study/i10n/localization_intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  String text, {
  gravity: ToastGravity.CENTER,
  toastLength: Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIos: 1,
    backgroundColor: Colors.grey[600],
    fontSize: 16.0,
  );
}

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.of(context).pop();
}

Future<bool> showAlertDialog(BuildContext context, String tip) {
  return showDialog<bool>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        content: Text(tip),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).yes),
            onPressed: () => Navigator.pop(context, true),
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () => Navigator.pop(context, false),
          ),
        ],
      );
    },
  );
}
