import 'package:flutter/material.dart';
import 'package:flutter_study/i10n/localization_intl.dart';

class ThemePage extends StatelessWidget {
  List<MaterialColor> _themes;

  ThemePage() : super() {
    _themes = <MaterialColor>[
      Colors.blue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.red,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).theme),
      ),
      body: ListView(
        children: _themes.map((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //
            },
          );
        }).toList(),
      ),
    );
  }
}
