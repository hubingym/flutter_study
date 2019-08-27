import 'package:flutter/material.dart';
import 'package:flutter_study/i10n/localization_intl.dart';

Future<bool> showAlertDialog(BuildContext context, String tip) {
  return showDialog<bool>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        content: Text(tip),
        actions: <Widget>[
          FlatButton(
            child: Text(AppLocalizations.of(context).yes),
            onPressed: () => Navigator.pop(context, false),
          ),
          FlatButton(
            child: Text(AppLocalizations.of(context).cancel),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      );
    },
  );
}
